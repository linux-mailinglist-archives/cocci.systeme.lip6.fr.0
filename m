Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F80AF7EC
	for <lists+cocci@lfdr.de>; Wed, 11 Sep 2019 10:29:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8B8Sjxc021079;
	Wed, 11 Sep 2019 10:28:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E7F1277AA;
	Wed, 11 Sep 2019 10:28:44 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B781E76D9
 for <cocci@systeme.lip6.fr>; Wed, 11 Sep 2019 10:28:43 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x8B8ShBZ017551
 for <cocci@systeme.lip6.fr>; Wed, 11 Sep 2019 10:28:43 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,492,1559512800"; d="scan'208";a="319002343"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 10:28:43 +0200
Date: Wed, 11 Sep 2019 10:28:44 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <dfc2d794-93b6-4f9c-a6c9-9af6b8708f9b@web.de>
Message-ID: <alpine.DEB.2.21.1909111028240.2885@hadrien>
References: <dfc2d794-93b6-4f9c-a6c9-9af6b8708f9b@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-519543260-1568190524=:2885"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 11 Sep 2019 10:28:45 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Wed, 11 Sep 2019 10:28:43 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci]
 =?utf-8?q?Adjusting_SmPL_script_=E2=80=9Ctests/nest3=2Eco?=
 =?utf-8?b?Y2Np4oCdPw==?=
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-519543260-1568190524=:2885
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 11 Sep 2019, Markus Elfring wrote:

> Hello,
>
> I have taken another look at a script for the semantic patch language.
> https://github.com/coccinelle/coccinelle/blob/560c3d02e2085e83e9bcd40842eec7e774140131/tests/nest3.cocci
>
> Can the following code variant be a bit nicer?
> (Would you like to avoid the message “warning: rule starting on line 1:
> metavariable func not used in the - or context code”?)

I have dropped the declaration of the metavariable.

julia

>
> @@
> identifier f, i;
> @@
> - int i;
>   <... when != i
> - for (i = ...; i < ...; i++) f(...);
> + f(1);
>   ...>
>
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-519543260-1568190524=:2885
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-519543260-1568190524=:2885--
