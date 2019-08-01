Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 107077DB68
	for <lists+cocci@lfdr.de>; Thu,  1 Aug 2019 14:26:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x71CQ5W1004598;
	Thu, 1 Aug 2019 14:26:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 726F3779F;
	Thu,  1 Aug 2019 14:26:05 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2F3B4768E
 for <cocci@systeme.lip6.fr>; Thu,  1 Aug 2019 14:26:01 +0200 (CEST)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x71CQ0gR014758
 for <cocci@systeme.lip6.fr>; Thu, 1 Aug 2019 14:26:00 +0200 (CEST)
Received: from localhost (p54B333D2.dip0.t-ipconnect.de [84.179.51.210])
 by pokefinder.org (Postfix) with ESMTPSA id 61D0B2C2817;
 Thu,  1 Aug 2019 14:26:00 +0200 (CEST)
Date: Thu, 1 Aug 2019 14:25:59 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Stephen Boyd <swboyd@chromium.org>
Message-ID: <20190801122559.GC1659@ninjato>
References: <20190730053845.126834-1-swboyd@chromium.org>
 <20190731142645.GA1680@kunai>
 <5d41ab2c.1c69fb81.6129.661f@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <5d41ab2c.1c69fb81.6129.661f@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 01 Aug 2019 14:26:08 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 01 Aug 2019 14:26:00 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Rob Herring <robh@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Javier Martinez Canillas <javierm@redhat.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        cocci@systeme.lip6.fr, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Cocci] [PATCH v5 0/3] Add error message to platform_get_irq*()
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
Content-Type: multipart/mixed; boundary="===============1829830846=="
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr


--===============1829830846==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> these drivers pop up, I think we can have another function like
> platform_get_irq_probe() or platform_get_irq_nowarn() that doesn't print
> an error message. Then we can convert the drivers that are poking around
> for interrupts to use this new function instead. It isn't the same as a
> platform_get_optional_irq() API because it returns an error when the irq
> isn't there or we fail to parse something, but at least the error
> message is gone.

True.

I still feel uneasy about pushing false positive error messages to
users. Do you think your cocci-script could be updated to modify drivers
which do not bail out when platform_get_irq() fails to use
platform_get_irq_nowarn()? I'd think this would catch most of them?

Or maybe the other way around? platform_get_irq_warn() and only convert
those which print something?


--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1C2lcACgkQFA3kzBSg
KbbdSg/9HFWL5iUwHEJsV52vt2XJENx9m8QrdHV7lZ7jTjNxOOjLR976Iv/OBTSf
M5+n+gSboLLJceumo7HdRuMmAf0+VUk/Di4vfIdhHTSqo39L5cUNvIOi64Qkt3We
mrAv8PyJUaQvxS8GUD3VaWqpPLmqFuQVPWkjBdfkJtmOuhbn0/BR6zeScXVQ6WBA
0wbiDg4ttOPZqRzmgqLmOjN8k/b5bxEirMvp6HUUK5wxXaI88Odaj8XvGAbl6IJ3
G+youdvTAoueajXSegpQNbp3q2RSt1HOaSSG+86n0WL+R4m5veK8kxvWjMNe6D1s
RlaqozlL2m+zbXAPpT3rY8OKiBxUKkaTNhUmdMOxWxsrbgWZAapeU3f9djwmlXNx
BStZhTMnnSy3JcbS6Fk9cKjgHYfDQTaNDCWkdrSC5V3To8ZytkkMVbT7LwzmcHLF
bbPPrtfKDSLeSUKufK+ICrYWfVQLgAWh9XyX+Vtm3NZ+kQvQMxk6QCV55A5wkRqk
4JHRwks9yjkpCr18m5kpgYO87/AlA7TKz3nxoYLucIXvc+56exCRBCC8dQiHbaSM
Q5A7bNLnWWa35txkCTIMlMCBQbnvqe5GH2H6CvRk21KyJqwVOfpio56V05qjYRep
YkyTYumHpai0MlMIQdHbdOLFxtMInjyeDjw/mnaqdpL0gRqzUoE=
=aWtB
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--

--===============1829830846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--===============1829830846==--
