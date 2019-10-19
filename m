Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B7ADDCE0
	for <lists+cocci@lfdr.de>; Sun, 20 Oct 2019 07:44:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9K5i3kc002833;
	Sun, 20 Oct 2019 07:44:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E9E5777D7;
	Sun, 20 Oct 2019 07:44:03 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B25BD7792
 for <cocci@systeme.lip6.fr>; Sun, 20 Oct 2019 02:43:12 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0143.hostedemail.com
 [216.40.44.143])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9K0hBbY023735
 for <cocci@systeme.lip6.fr>; Sun, 20 Oct 2019 02:43:11 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 27EB51802CCB3
 for <cocci@systeme.lip6.fr>; Sat, 19 Oct 2019 22:13:31 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 60D29181D2FC9;
 Sat, 19 Oct 2019 22:13:28 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3351:3622:3865:3866:3867:3868:3871:3874:4321:5007:6742:10004:10400:10848:11232:11658:11914:12114:12297:12679:12740:12760:12895:13069:13161:13229:13311:13357:13439:14659:21080:21433:21627:30012:30054:30091,
 0,
 RBL:47.151.135.224:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:24,
 LUA_SUMMARY:none
X-HE-Tag: pull40_1de9676909547
X-Filterd-Recvd-Size: 2185
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Sat, 19 Oct 2019 22:13:25 +0000 (UTC)
Message-ID: <c8816d85b696cb96318e17b7010b84f09bc67bf7.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Marc Zyngier <maz@kernel.org>, Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 19 Oct 2019 15:13:24 -0700
In-Reply-To: <868spgzcti.wl-maz@kernel.org>
References: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
 <693a3b68-a0f1-81fe-40ce-2b6ba189450c@web.de>
 <868spgzcti.wl-maz@kernel.org>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 20 Oct 2019 07:44:05 +0200 (CEST)
X-Greylist: Delayed for 01:49:59 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Sun, 20 Oct 2019 02:43:11 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Sun, 20 Oct 2019 07:44:00 +0200
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michal Marek <michal.lkml@markovi.net>,
        YueHaibing <yuehaibing@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] coccinelle: api/devm_platform_ioremap_resource: remove
 useless script
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

On Sat, 2019-10-19 at 21:43 +0100, Marc Zyngier wrote:
> Providing Coccinelle scripts that scream about perfectly valid code is
> pointless, and the result is actively harmful.

Doubtful.

If the new code is smaller object code and correct
than the conversion is worthwhile.

fyi:

There are already ~450 uses of this function and maybe
~800 possible additional conversions.

> If said script was providing a correct semantic patch instead of being
> an incentive for people to churn untested patches that span the whole
> tree, that'd be a different story.

Right.


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
