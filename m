Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 771F1102E4B
	for <lists+cocci@lfdr.de>; Tue, 19 Nov 2019 22:37:12 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAJLatvW018760;
	Tue, 19 Nov 2019 22:36:55 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9804177DC;
	Tue, 19 Nov 2019 22:36:55 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5926C74EC
 for <cocci@systeme.lip6.fr>; Tue, 19 Nov 2019 22:36:53 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xAJLaqW2025511
 for <cocci@systeme.lip6.fr>; Tue, 19 Nov 2019 22:36:52 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,219,1571695200"; d="scan'208";a="327306099"
Received: from abo-228-123-68.mrs.modulonet.fr (HELO hadrien) ([85.68.123.228])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 22:36:52 +0100
Date: Tue, 19 Nov 2019 22:36:51 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <d178b6b3-7ef1-4ad7-a747-d65249a9667a@web.de>
Message-ID: <alpine.DEB.2.21.1911192235010.2592@hadrien>
References: <1574184500-29870-3-git-send-email-Julia.Lawall@lip6.fr>
 <d178b6b3-7ef1-4ad7-a747-d65249a9667a@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-319011006-1574199412=:2592"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 19 Nov 2019 22:36:55 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 19 Nov 2019 22:36:53 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 2/4] coccinelle: platform_get_irq: handle
 2-statement branches
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

--8323329-319011006-1574199412=:2592
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Tue, 19 Nov 2019, Markus Elfring wrote:

> > From: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> I wonder about this information.
> Would you like to use the tag “Suggested-by” instead?

Sorry, I seem to have done something quite wrong on this patch.  I will
fix it.

>
>
> …
> > +++ b/scripts/coccinelle/api/platform_get_irq.cocci
> > @@ -31,6 +31,25 @@ if ( \( ret < 0 \| ret <= 0 \) )
> …
> > +ret =
> > +(
> > +platform_get_irq
> > +|
> > +platform_get_irq_byname
> > +)(E, ...);
> > +
> > +if ( \( ret < 0 \| ret <= 0 \) )
> > +-{
> > +-dev_err(...);
> > +S
> > +-}
>
> How do you think about to use the following SmPL code variant?

And the benefit is what?

julia

> + ret =
> +(platform_get_irq
> +|platform_get_irq_byname
> +)(E, ...);
> +
> + if ( \( ret < 0 \| ret <= 0 \) )
> +-{
> +-dev_err(...);
> + S
> +-}
>
> Regards,
> Markus
>
--8323329-319011006-1574199412=:2592
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-319011006-1574199412=:2592--
