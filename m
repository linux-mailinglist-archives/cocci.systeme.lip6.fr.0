Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 128BC2BA198
	for <lists+cocci@lfdr.de>; Fri, 20 Nov 2020 05:59:15 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AK4wjbr008545;
	Fri, 20 Nov 2020 05:58:45 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id F2A5477C4;
	Fri, 20 Nov 2020 05:58:44 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 621737B6
 for <cocci@systeme.lip6.fr>; Fri, 20 Nov 2020 05:58:43 +0100 (CET)
Received: from smtprelay.hostedemail.com (smtprelay0078.hostedemail.com
 [216.40.44.78])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AK4wfti017368
 for <cocci@systeme.lip6.fr>; Fri, 20 Nov 2020 05:58:42 +0100 (CET)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 2B39F1802C511
 for <cocci@systeme.lip6.fr>; Fri, 20 Nov 2020 00:11:18 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 126B1837F24F;
 Fri, 20 Nov 2020 00:11:14 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:968:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2828:2892:2901:3138:3139:3140:3141:3142:3354:3622:3743:3865:3867:3868:3870:3871:3872:3874:4250:4321:5007:6119:6121:7514:7903:8660:9010:10004:10400:10848:11026:11232:11658:11914:12295:12297:12663:12740:12760:12895:13069:13148:13230:13255:13311:13357:13439:14096:14097:14180:14181:14659:14721:21067:21080:21212:21433:21627:21939:30012:30054:30070:30075:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: toy75_2e0778727347
X-Filterd-Recvd-Size: 2707
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Fri, 20 Nov 2020 00:11:12 +0000 (UTC)
Message-ID: <b74517242de5790f8ab0cd9be00a70b9ab96564c.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandru Ardelean
 <ardeleanalex@gmail.com>
Date: Thu, 19 Nov 2020 16:11:11 -0800
In-Reply-To: <CAHp75VcT5hZH6m0Dri1h_EFjc7=4+1XoE7sRuQyfO75k9A0GKA@mail.gmail.com>
References: <CA+U=Dspy5+RE9agcLr6eY9DCMa1c5+++0JLeugMMBRXz4YLj1w@mail.gmail.com>
 <CAHp75VcT5hZH6m0Dri1h_EFjc7=4+1XoE7sRuQyfO75k9A0GKA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 20 Nov 2020 05:58:45 +0100 (CET)
X-Greylist: Delayed for 03:30:00 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Fri, 20 Nov 2020 05:58:42 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Robo Bot <apw@canonical.com>, Julia Lawall <julia.lawall@lip6.fr>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        LKML <linux-kernel@vger.kernel.org>, cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Proposal for a new checkpatch check;
 matching _set_drvdata() & _get_drvdata()
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

On Thu, 2020-11-19 at 17:16 +0200, Andy Shevchenko wrote:
> On Thu, Nov 19, 2020 at 4:09 PM Alexandru Ardelean
> <ardeleanalex@gmail.com> wrote:
> > 
> > Hey,
> > 
> > So, I stumbled on a new check that could be added to checkpatch.
> > Since it's in Perl, I'm reluctant to try it.
> > 
> > Seems many drivers got to a point where they now call (let's say)
> > spi_set_drvdata(), but never access that information via
> > spi_get_drvdata().
> > Reasons for this seem to be:
> > 1. They got converted to device-managed functions and there is no
> > longer a remove hook to require the _get_drvdata() access
> > 2. They look like they were copied from a driver that had a
> > _set_drvdata() and when the code got finalized, the _set_drvdata() was
> > omitted
> > 
> > There are a few false positives that I can notice at a quick look,
> > like the data being set via some xxx_set_drvdata() and retrieved via a
> > dev_get_drvdata().
> 
> I can say quite a few. And this makes a difference.
> So, basically all drivers that are using PM callbacks would rather use
> dev_get_drvdata() rather than bus specific.
> 
> > I think checkpatch reporting these as well would be acceptable simply
> > from a reviewability perspective.
> > 
> > I did a shell script to quickly check these. See below.
> > It's pretty badly written but it is enough for me to gather a list.
> > And I wrote it in 5 minutes :P
> > I initially noticed this in some IIO drivers, and then I suspected
> > that this may be more widespread.
> 
> It seems more suitable for coccinelle.

To me as well.


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
