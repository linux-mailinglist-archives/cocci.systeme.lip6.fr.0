Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC43199356
	for <lists+cocci@lfdr.de>; Tue, 31 Mar 2020 12:22:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 02VAMAaT025657;
	Tue, 31 Mar 2020 12:22:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1F54F7824;
	Tue, 31 Mar 2020 12:22:10 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6D90E780F
 for <cocci@systeme.lip6.fr>; Tue, 31 Mar 2020 12:22:08 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0022.hostedemail.com
 [216.40.44.22])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 02VAM61n017471
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Tue, 31 Mar 2020 12:22:07 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 52DD5180388FE
 for <cocci@systeme.lip6.fr>; Tue, 31 Mar 2020 09:04:41 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id F2265181D2077;
 Tue, 31 Mar 2020 09:04:37 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:2915:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:3874:4321:4605:5007:7903:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13073:13311:13357:13439:14096:14097:14659:14721:21080:21324:21451:21627:30054:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: part09_45710aadc8c46
X-Filterd-Recvd-Size: 1847
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Tue, 31 Mar 2020 09:04:36 +0000 (UTC)
Message-ID: <471262a54c6919efe62917ec2beb43e6bd45e0b1.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 31 Mar 2020 02:02:42 -0700
In-Reply-To: <alpine.DEB.2.21.2003311048341.3188@hadrien>
References: <f8581a548767a5d7e460816f125566fca8694aa0.camel@perches.com>
 <alpine.DEB.2.21.2003311048341.3188@hadrien>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 31 Mar 2020 12:22:11 +0200 (CEST)
X-Greylist: Delayed for 00:40:02 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Tue, 31 Mar 2020 12:22:07 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] linux: bad logic in repetitive tests
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

On Tue, 2020-03-31 at 10:50 +0200, Julia Lawall wrote:
> On Mon, 30 Mar 2020, Joe Perches wrote:
> 
> > There is a block of if tests against the same variable
> > in include/linux/mtd/pfow.h that likely is defective
> > 
> >         if (prog_status & 0x3)
> >                 ...
> >         else if (prog_status & 0x2)
> >                 ...
> >         else (prog_status & 0x1)
> >                 ...
> > 
> > If the first test is true the subsequent 2 tests aren't
> > possible.
> > 
> > Likely the first test should be something like
> > 
> > 	if ((prog_status & 0x03) == 0x03)
> > 
> > Is there a way for cocci to find this style of bitwise
> > logic defect?
> 
> I guess this occurs rarely enough that just looking for a succession of
> bit and tests on the same variable would be good enough to narrow it down
> to something manageable to check by hand.

I suppose, but I think misuse of the and'ed bits
by #define is the most likely defect as it's
very difficult to verify visually.

Hard to otherwise quantify.

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
