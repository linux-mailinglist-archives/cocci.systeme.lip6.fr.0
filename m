Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 463291EE96C
	for <lists+cocci@lfdr.de>; Thu,  4 Jun 2020 19:28:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 054HSSS9026411;
	Thu, 4 Jun 2020 19:28:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 564B37828;
	Thu,  4 Jun 2020 19:28:28 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A579D5D47
 for <cocci@systeme.lip6.fr>; Thu,  4 Jun 2020 19:28:26 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 054HSQ1v028304
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 4 Jun 2020 19:28:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,472,1583190000"; d="scan'208";a="453044118"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 19:28:25 +0200
Date: Thu, 4 Jun 2020 19:28:25 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <65dee3e0-7df9-5b38-fe4c-5de3f70380a0@linux.com>
Message-ID: <alpine.DEB.2.21.2006041927020.2577@hadrien>
References: <20200604140805.111613-1-efremov@linux.com>
 <alpine.DEB.2.21.2006041614300.2577@hadrien>
 <a188acce-348b-b106-9180-708c3050ef8d@linux.com>
 <alpine.DEB.2.21.2006041749520.2577@hadrien>
 <65dee3e0-7df9-5b38-fe4c-5de3f70380a0@linux.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 04 Jun 2020 19:28:29 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 04 Jun 2020 19:28:26 +0200 (CEST)
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

> After all it seems reasonable to me to add forall and memset_explicit rather
> than handle all these false positives. Something like this for v2?
>
> @r depends on !patch && !(file in "lib/test_kasan.c") && !(file in "mm/slab_common.c") forall@
> expression *E;
> position p;
> @@
>
> * \(memset\|memset_explicit\)(E, 0, ...);
>   ... when != E
> * kfree(E)@p;
>
> Do I need to add "when strict" with forall or it's already enabled in this case?
> Do I need to enable forall for pathing "-/+"?

forall seems entirely reasonable.  You don't need it in the -/+ case.  I
would put when strict in both cases.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
