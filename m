Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2D779372
	for <lists+cocci@lfdr.de>; Mon, 29 Jul 2019 20:56:15 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6TItim2012010;
	Mon, 29 Jul 2019 20:55:44 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 611B8779C;
	Mon, 29 Jul 2019 20:55:44 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A1727776D
 for <cocci@systeme.lip6.fr>; Mon, 29 Jul 2019 20:55:41 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0214.hostedemail.com
 [216.40.44.214])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6TIte12019939
 for <cocci@systeme.lip6.fr>; Mon, 29 Jul 2019 20:55:41 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 2B62C800BAB1
 for <cocci@systeme.lip6.fr>; Mon, 29 Jul 2019 16:28:39 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id B58A818224D97;
 Mon, 29 Jul 2019 16:28:36 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::,
 RULES_HIT:41:355:379:599:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3350:3622:3866:3867:3868:3870:3871:3872:3874:4321:5007:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13019:13069:13160:13229:13311:13357:13439:14659:14721:21080:21433:21627:21740:30054:30083:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:24,
 LUA_SUMMARY:none
X-HE-Tag: stove18_681e57aab8a60
X-Filterd-Recvd-Size: 2302
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Mon, 29 Jul 2019 16:28:35 +0000 (UTC)
Message-ID: <0b6936cb34ca0dcd76b155b9b38366e82b1376f0.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@lip6.fr>,
        Linus Torvalds
 <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>
Date: Mon, 29 Jul 2019 09:28:34 -0700
In-Reply-To: <alpine.DEB.2.21.1907291004220.2686@hadrien>
References: <7ab8957eaf9b0931a59eff6e2bd8c5169f2f6c41.1563841972.git.joe@perches.com>
 <66fcdbf607d7d0bea41edb39e5579d63b62b7d84.camel@perches.com>
 <alpine.DEB.2.21.1907231546090.2551@hadrien>
 <0f3ba090dfc956f5651e6c7c430abdba94ddcb8b.camel@perches.com>
 <alpine.DEB.2.21.1907232252260.2539@hadrien>
 <d5993902fd44ce89915fab94f4db03f5081c3c8e.camel@perches.com>
 <alpine.DEB.2.21.1907232326360.2539@hadrien>
 <f909b4b31f123c7d88535db397a04421077ed0ab.camel@perches.com>
 <563222fbfdbb44daa98078db9d404972@AcuMS.aculab.com>
 <d2b2b528b9f296dfeb1d92554be024245abd678e.camel@perches.com>
 <alpine.DEB.2.21.1907242040490.10108@hadrien>
 <a0e892c3522f4df2991119a2a30cd62ec14c76cc.camel@perches.com>
 <alpine.DEB.2.21.1907250856450.2555@hadrien>
 <eaef283741c0a6a718040f99a17bdb9882bde665.camel@perches.com>
 <alpine.DEB.2.21.1907291004220.2686@hadrien>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 29 Jul 2019 20:55:46 +0200 (CEST)
X-Greylist: Delayed for 02:09:58 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Mon, 29 Jul 2019 20:55:41 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: David Laight <David.Laight@ACULAB.COM>, cocci <cocci@systeme.lip6.fr>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cocci] [Fwd: [PATCH 1/2] string: Add stracpy and stracpy_pad
 mechanisms]
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

On Mon, 2019-07-29 at 10:07 -0400, Julia Lawall wrote:
> I see that stracpy is now in linux-next.  Would it be reasonable to send
> patches adding uses now?

My preference would be to have:

o A provably correct script  If a small subset of
  possible conversions are skipped, that's fine.
o As piecemeal patches cause a lot of churn, work
  for individual maintainers, and also are not
  universally applied, have that script run
  kernel-wide after an rc1 and applied all-at-once.



_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
