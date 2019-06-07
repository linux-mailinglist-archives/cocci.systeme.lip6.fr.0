Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A1C3951B
	for <lists+cocci@lfdr.de>; Fri,  7 Jun 2019 21:00:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x57IxoRu020941;
	Fri, 7 Jun 2019 20:59:50 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 95A497772;
	Fri,  7 Jun 2019 20:59:50 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 18927776C
 for <cocci@systeme.lip6.fr>; Fri,  7 Jun 2019 20:59:49 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x57IxmRo023443
 for <cocci@systeme.lip6.fr>; Fri, 7 Jun 2019 20:59:48 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,564,1557180000"; d="scan'208";a="308563533"
Received: from abo-161-111-68.mrs.modulonet.fr (HELO hadrien) ([85.68.111.161])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 20:59:47 +0200
Date: Fri, 7 Jun 2019 20:59:47 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <111faed6-ada9-63d8-b09c-2e6faf678351@web.de>
Message-ID: <alpine.DEB.2.21.1906072059150.3300@hadrien>
References: <5c138195-ac1a-4ad6-c6e6-720acd4ea34f@metux.net>
 <111faed6-ada9-63d8-b09c-2e6faf678351@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1355400532-1559933988=:3300"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 07 Jun 2019 20:59:51 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 07 Jun 2019 20:59:48 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] How to replace obsolete #ifdef's?
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

--8323329-1355400532-1559933988=:3300
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 7 Jun 2019, Markus Elfring wrote:

> > Just wrapping the assignment into the macro call turned out to be easy.
>
> I am curious how your transformation approaches will evolve further.
>
>
> > But I haven't found a way to remove the now #ifdef :(
>
> The support for preprocessor functionality is limited by the semantic patch
> language so far.
> Would you like to try another SmPL script variant out?
>
> @replacement@
> constant text;
> expression value;
> identifier my_name;
> type driver_type;
> @@
>  static
>  driver_type
>  my_name = {
>            .driver = {
> -                    .name = text,
> -                    .of_match_table = value,
> -                    },
> +                    .name = text,
> +                    .of_match_table = of_match_ptr(value),

I guess that there is no guarantee that these are the only fields.

julia

> +                    },
>  ...
>            };
>
>
> Do you find the following test result acceptable finally?
>
>
> elfring@Sonne:~/Projekte/Linux/next-patched> spatch ~/Projekte/Coccinelle/Probe/Weigelt8.cocci sound/soc/codecs/pcm3060-i2c.c
> init_defs_builtins: /usr/local/bin/../lib/coccinelle/standard.h
> …
> @@ -45,9 +45,7 @@ MODULE_DEVICE_TABLE(of, pcm3060_of_match
>  static struct i2c_driver pcm3060_i2c_driver = {
>  	.driver = {
>  		.name = "pcm3060",
> -#ifdef CONFIG_OF
> -		.of_match_table = pcm3060_of_match,
> -#endif /* CONFIG_OF */
> +		.of_match_table = of_match_ptr(pcm3060_of_match),
>  	},
>  	.id_table = pcm3060_i2c_id,
>  	.probe = pcm3060_i2c_probe,
>
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-1355400532-1559933988=:3300
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1355400532-1559933988=:3300--
