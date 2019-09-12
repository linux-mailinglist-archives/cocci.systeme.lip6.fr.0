Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A35EEB0A4D
	for <lists+cocci@lfdr.de>; Thu, 12 Sep 2019 10:28:58 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8C8SYj4026177;
	Thu, 12 Sep 2019 10:28:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E330F77B1;
	Thu, 12 Sep 2019 10:28:33 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 412917795
 for <cocci@systeme.lip6.fr>; Thu, 12 Sep 2019 10:28:32 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8C8SVKE023691
 for <cocci@systeme.lip6.fr>; Thu, 12 Sep 2019 10:28:31 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,495,1559512800"; d="scan'208";a="401377134"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 10:27:45 +0200
Date: Thu, 12 Sep 2019 10:27:47 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: David Young <dyoung@netbsd.org>
In-Reply-To: <20190912015155.GE26691@pobox.com>
Message-ID: <alpine.DEB.2.21.1909121027240.2876@hadrien>
References: <20190912015155.GE26691@pobox.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 12 Sep 2019 10:28:36 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 12 Sep 2019 10:28:31 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] continue statement of death?
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



On Wed, 11 Sep 2019, David Young wrote:

> Today I built and installed Coccinelle 1.0.7 on NetBSD.
>
> I am processing this fragment of NetBSD kernel code, `tbr_timeout.c`,
>
> | /*
> |  * tbr_timeout goes through the interface list, and kicks the drivers
> |  * if necessary.
> |  */
> | static void
> | tbr_timeout(void *arg)
> | {
> |         struct ifnet *ifp;
> |         int active, s;
> |
> |         active = 0;
> |         s = splnet();
> |         for (ifp = TAILQ_FIRST(&ifnet); ifp; ifp = TAILQ_NEXT(ifp, if_list)) {
> |                 if (!TBR_IS_ENABLED(&ifp->if_snd))
> | #if 1
> |                         continue;
> | #endif
> |                 active++;
> |                 if (!IFQ_IS_EMPTY(&ifp->if_snd) && ifp->if_start != NULL)
> |                         (*ifp->if_start)(ifp);
> |         }
> |         splx(s);
> |         if (active > 0)
> |                 CALLOUT_RESET(&tbr_callout, 1, tbr_timeout, NULL);
> |         else
> |                 tbr_timer = 0;  /* don't need tbr_timer anymore */
> | }
> |
>
> using this semantic patch, `tailq.spatch`,
>
> | @@
> | identifier I, N;
> | expression H;
> | statement S;
> | iterator name TAILQ_FOREACH;
> | @@
> |
> | - for (I = TAILQ_FIRST(H); I != NULL; I = TAILQ_NEXT(I, N)) S
> | + TAILQ_FOREACH(I, H, N) S
>
> I find that if the condition in the `#if` directive is 1, then `spatch
> --sp-file tailq.spatch -o tbr_timeout.spatch tbr_timeout.c` runs for
> a few minutes before running out of memory. `spatch` prints this
> mysterious message when it starts:
>
>      (ONCE) already tagged but only removed, so safe
>
> If I turn the condition to 0, however, spatch instantaneously prints the
> result with the `for (...)` clause turned to `TAILQ_FOREACH(...)`, as
> expected.  I don't see the mysterious `(ONCE) ...` message.
>
> Any ideas why `continue;` is troublesome to spatch?

I'm looking into it.  It seems to be a pretty printing problem.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
