Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F524DDCDF
	for <lists+cocci@lfdr.de>; Sun, 20 Oct 2019 07:44:20 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9K5i2nD028225;
	Sun, 20 Oct 2019 07:44:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D5B7177C2;
	Sun, 20 Oct 2019 07:44:02 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 94FC67792
 for <cocci@systeme.lip6.fr>; Sat, 19 Oct 2019 14:09:46 +0200 (CEST)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9JC9ilV029148
 for <cocci@systeme.lip6.fr>; Sat, 19 Oct 2019 14:09:44 +0200 (CEST)
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr
 [86.202.229.42])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 79C991BF208;
 Sat, 19 Oct 2019 12:09:41 +0000 (UTC)
Date: Sat, 19 Oct 2019 14:09:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <20191019120941.GL3125@piout.net>
References: <20191017142237.9734-1-alexandre.belloni@bootlin.com>
 <81269cd6-e26d-b8aa-cf17-3a2285851564@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81269cd6-e26d-b8aa-cf17-3a2285851564@web.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 20 Oct 2019 07:44:03 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 19 Oct 2019 14:09:44 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Sun, 20 Oct 2019 07:43:59 +0200
Cc: Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH] coccinelle: api/devm_platform_ioremap_resource:
 remove useless script
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

On 19/10/2019 11:00:47+0200, Markus Elfring wrote:
> > While it is useful for new drivers to use devm_platform_ioremap_resource,
> 
> This is nice.
> 
> 
> > this script is currently used to spam maintainers,
> 
> This view is unfortunate.
> 
> Do we stumble on a target conflict again?
> 
> 
> > often updating very old drivers.
> 
> This can also happen.
> 
> 
> > The net benefit is the removal of 2 lines of code in the driver
> 
> Additional effects can be reconsidered, can't they?
> 

What are the additional effects? What is the end goal of converting all
the existing drivers to devm_platform_ioremap_resource? The existing
code is currently always correct and it is difficult to see how this
would lead to any bug avoidance in the long term.

> > but the review load for the maintainers is huge.
> 
> Does collateral evolution trigger a remarkable amount of changes occasionally?
> 

This is not an evolution, it is unnecessary churn. Those patches have no
benefit and eat up very valuable reviewer time.

> 
> How will such feedback influence the development and integration of
> further scripts for the semantic patch language (Coccinelle software)?
> 

There are a few other scripts that have no added value when applied to
existing code, like ptr_ret.cocci.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
