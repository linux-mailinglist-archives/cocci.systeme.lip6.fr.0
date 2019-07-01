Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A87EA3A0DF
	for <lists+cocci@lfdr.de>; Sat,  8 Jun 2019 19:27:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x58HR3fw007386;
	Sat, 8 Jun 2019 19:27:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D69B67770;
	Sat,  8 Jun 2019 19:27:03 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 025E2775D
 for <cocci@systeme.lip6.fr>; Sat,  8 Jun 2019 19:27:02 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x58HR0EQ010286
 for <cocci@systeme.lip6.fr>; Sat, 8 Jun 2019 19:27:00 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,568,1557180000"; d="scan'208";a="386580694"
Received: from unknown (HELO hadrien) ([89.191.33.34])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jun 2019 19:26:59 +0200
Date: Sat, 8 Jun 2019 19:26:35 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
Message-ID: <alpine.DEB.2.21.1906081925090.2543@hadrien>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <f09006a3-691c-382a-23b8-8e9ff5b4a5f1@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 08 Jun 2019 19:27:05 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sat, 08 Jun 2019 19:27:00 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] Coccinelle: api: add devm_platform_ioremap_resource
	script
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



On Sat, 8 Jun 2019, Markus Elfring wrote:

> > +- e1 = devm_ioremap_resource(arg4, id);
> > ++ e1 = devm_platform_ioremap_resource(arg1, arg3);
>
> Can the following specification variant matter for the shown SmPL
> change approach?
>
> + e1 =
> +-     devm_ioremap_resource(arg4, id
> ++     devm_platform_ioremap_resource(arg1, arg3
> +                           );

In the latter case, the original formatting of e1 will be preserved.  But
there is not usually any interesting formatting on the left side of an
assignment (ie typically no newlines or comments).  I can see no purpose
to factorizing the right parenthesis.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
