Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 144832349C1
	for <lists+cocci@lfdr.de>; Fri, 31 Jul 2020 18:56:01 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06VGtZbO023150;
	Fri, 31 Jul 2020 18:55:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id AB0E47807;
	Fri, 31 Jul 2020 18:55:35 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C0EDB4121
 for <cocci@systeme.lip6.fr>; Fri, 31 Jul 2020 18:55:33 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06VGtXGK004202
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 31 Jul 2020 18:55:33 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,418,1589234400"; d="scan'208";a="355725617"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 18:55:33 +0200
Date: Fri, 31 Jul 2020 18:55:32 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <ba2b2337-2c58-4029-938b-05184a23a758@linux.com>
Message-ID: <alpine.DEB.2.22.394.2007311853250.2455@hadrien>
References: <ba2b2337-2c58-4029-938b-05184a23a758@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 31 Jul 2020 18:55:38 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 31 Jul 2020 18:55:33 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Match variable declaration with init expression
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



On Fri, 31 Jul 2020, Denis Efremov wrote:

> Hi,
>
> This pattern:
> - E = kzalloc(size, flags | __GFP_NOWARN);
> - if (\(!E\|E == null\))@p
> -   E = vzalloc(size);
> + E = kvzalloc(size, flags);
>
> matches this code:
> void *p;
> p = kzalloc(size, gfp | __GFP_NOWARN);
>
> if (!p)
> 	p = vzalloc(size);
>
> But not this:
> void *p = kzalloc(size, gfp | __GFP_NOWARN);
>
> if (!p)
> 	p = vzalloc(size);
>
> What can I do to match them both?

For a transformation like that, it's not possible to match both at once.
The problem is that it doesn't know what you want to do with E.  You can't
remove it and just leave void alone.

I don't know if a disjunction is possible either, because one is a
declaration and the other is a statement.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
