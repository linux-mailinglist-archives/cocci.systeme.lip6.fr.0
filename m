Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B971FC908
	for <lists+cocci@lfdr.de>; Wed, 17 Jun 2020 10:40:21 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05H8e2Mb022003;
	Wed, 17 Jun 2020 10:40:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3F5A8781F;
	Wed, 17 Jun 2020 10:40:02 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5D4BD3D0F
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 10:40:00 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05H8dx2Z000685
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 10:39:59 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,522,1583190000"; d="scan'208";a="351831187"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 10:39:59 +0200
Date: Wed, 17 Jun 2020 10:39:59 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <781f2962-b651-9849-d52c-f2e7818b6cb1@web.de>
Message-ID: <alpine.DEB.2.22.394.2006171037170.2501@hadrien>
References: <37e4e561-8d88-263a-0037-f58cb8c1861e@web.de>
 <CALOnNCpr_-1BLPN+Bayof6XjLLvVrMgR4Z+EHpC_8RnAOWiD0Q@mail.gmail.com>
 <15347e89-21a9-8e08-8301-fef957c7332a@web.de>
 <e6a9456615df93634d86eb342a3282809fa62acd.camel@gmail.com>
 <781f2962-b651-9849-d52c-f2e7818b6cb1@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2122879059-1592383199=:2501"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 10:40:03 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 10:39:59 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Software analysis around data type annotations
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

--8323329-2122879059-1592383199=:2501
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 17 Jun 2020, Markus Elfring wrote:

> > *void * __iomem action(...)
> >  {...}
> >
> > It's not quite in line with the what-you-see-is-what-you-get principle,
> > but it'll work for your use case.
>
> Usable output is produced after the adjusted position for the macro.
>
> elfring@Sonne:~/Projekte/Linux/next-patched> spatch ~/Projekte/Coccinelle/janitor/show_iomem_functions3.cocci drivers/base/platform.c
> …
> -void __iomem *
> -devm_platform_ioremap_resource_byname(struct platform_device *pdev,
> -				      const char *name)
> …
>
>
> >> How many software development resources will be needed
> >> to get such SmPL script variants to work?
> >
> > Please stop asking such questions
>
> I am going to present similar questions occasionally.

Please stop.  The chance that people will help you will increase.  No one
is interested in quantifying software development resources.  Even your
favorite phrase "my software development attention" is really really
annoying.  Just drop "software development" from your vocabulary and it
will be a step in the right direction.

julia

>
>
> > and I'll be happy to help you out.
>
> Thanks for your positive feedback.
>
> I imagine that I can offer more concrete development items
> (besides the ones you might know already) if I would get
> also additional resources.
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-2122879059-1592383199=:2501
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-2122879059-1592383199=:2501--
