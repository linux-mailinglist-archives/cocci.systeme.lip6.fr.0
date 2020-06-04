Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC7B1EE80A
	for <lists+cocci@lfdr.de>; Thu,  4 Jun 2020 17:52:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 054FpmHC020053;
	Thu, 4 Jun 2020 17:51:48 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8F18B7828;
	Thu,  4 Jun 2020 17:51:48 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id BBAB85D47
 for <cocci@systeme.lip6.fr>; Thu,  4 Jun 2020 17:51:46 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 054FpimR004377
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 4 Jun 2020 17:51:44 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,472,1583190000"; d="scan'208";a="350605555"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 17:51:20 +0200
Date: Thu, 4 Jun 2020 17:51:19 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <a188acce-348b-b106-9180-708c3050ef8d@linux.com>
Message-ID: <alpine.DEB.2.21.2006041749520.2577@hadrien>
References: <20200604140805.111613-1-efremov@linux.com>
 <alpine.DEB.2.21.2006041614300.2577@hadrien>
 <a188acce-348b-b106-9180-708c3050ef8d@linux.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 04 Jun 2020 17:51:48 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 04 Jun 2020 17:51:44 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] coccinelle: api: add kzfree script
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



On Thu, 4 Jun 2020, Denis Efremov wrote:

>
>
> On 6/4/20 5:15 PM, Julia Lawall wrote:
> > Did you try ... here but find that some subexpressions of E could be
> > modified in between?
>
> Yes, I tried to use "... when != E = E1 when != &E" and results were bad.
> Now, I've tried forall and when strict. Here are examples:
>
> // forall added
> // Works well, suitable for v2. One additional catch in w1 driver.
> @r depends on !patch && !(file in "lib/test_kasan.c") && !(file in "mm/slab_common.c") forall@
> expression *E; // pointer. Results are equal as if we use E.
> position p;
> @@
>
> * memset(E, 0, ...);
>   ... when != E // Is it enough to match &E, E = E1?

Yes.

> * kfree(E)@p;
>
> //no forall, when strict
> //results are bad, too many false positives
> @r depends on !patch && !(file in "lib/test_kasan.c") && !(file in "mm/slab_common.c")@
> expression *E;
> position p;
> @@
>
> * memset(E, 0, ...);
>   ... when != E // E is not enough here
>       when strict

OK, it's reassonable.

> * kfree(E)@p;
>
> I guess that the difference is that "forall" requires that whole pattern should occur on
> every path, "when strict" states that kfree should be called on every path after memset.
> This results in missed uses of E in loops and under conditions. How can I state in this
> case that E should not occur at all (in all paths) in between memset, kfree even as a
> subexpression?
>
> // Doesn't work well
>   ... when != E
>       when != if (...) { ... E ... }
>       when != for(...;...;...) { ... E ... }

Could you send an example of some C code on which the result is not
suitable?

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
