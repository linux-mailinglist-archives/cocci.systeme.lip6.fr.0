Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ED91ABBBE
	for <lists+cocci@lfdr.de>; Thu, 16 Apr 2020 10:54:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03G8rmWu010563;
	Thu, 16 Apr 2020 10:53:48 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BA4C87831;
	Thu, 16 Apr 2020 10:53:48 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AAF747816
 for <cocci@systeme.lip6.fr>; Thu, 16 Apr 2020 10:53:46 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03G8rkqS014026
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Apr 2020 10:53:46 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,390,1580770800"; d="scan'208";a="445371646"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 10:53:46 +0200
Date: Thu, 16 Apr 2020 10:53:45 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <5702b553-d054-33a4-8544-f68ed5457acc@web.de>
Message-ID: <alpine.DEB.2.21.2004161052210.2447@hadrien>
References: <25b804fd-0d04-475d-f614-26c03c9fd544@web.de>
 <alpine.DEB.2.21.2004151949230.2381@hadrien>
 <5702b553-d054-33a4-8544-f68ed5457acc@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-419182295-1587027226=:2447"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Apr 2020 10:53:50 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Apr 2020 10:53:46 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Dejin Zheng <zhengdejin5@gmail.com>, Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Checking the replacement of two specific function calls
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

--8323329-419182295-1587027226=:2447
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 16 Apr 2020, Markus Elfring wrote:

> >> @replacement@
> >> expression* base, device, resource;
> >> @@
> >> -resource = platform_get_resource(device, IORESOURCE_MEM, 0);
> >>  base =
> >> -       devm_ioremap_resource(&device->dev, resource)
> >> +       devm_platform_get_and_ioremap_resource(device, 0, &resource)
> >>  ;
> …
> >> static int rcar_i2c_probe(struct platform_device *pdev)
> >> {
> >> 	struct rcar_i2c_priv *priv;
> …
> >> 	struct device *dev = &pdev->dev;
> …
> >> 	priv->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>
> >> 	priv->io = devm_ioremap_resource(dev, priv->res);
> >> 	if (IS_ERR(priv->io))
> >> 		return PTR_ERR(priv->io);
> …
> >> }
> …
> > Probably Coccinelle is not able to determine that priv->res and priv->io
> > are pointers, if you have not given it enough encouragement to look for
> > header files to find the defintion of the type of the priv structure.
>
> Would you find the following test command encouraging enough?
>
> elfring@Sonne:~/Projekte/Linux/next-patched> spatch --include-headers-for-types ~/Projekte/Coccinelle/janitor/use_devm_platform_get_and_ioremap_resource3.cocci drivers/i2c/busses/i2c-rcar.c

No, include headers for types doesn't have any impact on how many header
files are included.  You need options like --all-includes or
--recursive-includes.  Include headers for types means only look at the
included files to collect type information, but ignore these files in the
matching and transformation process.

julia
--8323329-419182295-1587027226=:2447
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-419182295-1587027226=:2447--
