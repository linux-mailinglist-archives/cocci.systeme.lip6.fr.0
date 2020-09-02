Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB4525B576
	for <lists+cocci@lfdr.de>; Wed,  2 Sep 2020 22:48:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 082Km2bw007705;
	Wed, 2 Sep 2020 22:48:02 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 6712F77BC;
	Wed,  2 Sep 2020 22:48:02 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9A5F93F6C
 for <cocci@systeme.lip6.fr>; Wed,  2 Sep 2020 22:48:00 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0221.hostedemail.com
 [216.40.44.221])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 082KlxCZ012082
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Wed, 2 Sep 2020 22:48:00 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id D5BB91802B4EC
 for <cocci@systeme.lip6.fr>; Wed,  2 Sep 2020 20:32:03 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id EBE63837F24A;
 Wed,  2 Sep 2020 20:31:59 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2693:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3871:3872:3873:3874:4321:4362:5007:6271:7903:10004:10400:11026:11232:11658:11914:12050:12296:12297:12679:12740:12760:12895:13069:13311:13357:13439:14096:14097:14180:14659:14721:21060:21080:21324:21627:21740:21939:30029:30054:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: shape99_4f0680d270a3
X-Filterd-Recvd-Size: 2333
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf10.hostedemail.com (Postfix) with ESMTPA;
 Wed,  2 Sep 2020 20:31:59 +0000 (UTC)
Message-ID: <ec1cc3309738bf1acab87fcf9178dbf7b204176a.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 02 Sep 2020 13:31:58 -0700
In-Reply-To: <alpine.DEB.2.22.394.2008302039000.3629@hadrien>
References: <de28becbfe76575b18c0bf47567b7f9c20f15f87.camel@perches.com>
 <alpine.DEB.2.22.394.2008300854510.3629@hadrien>
 <b43fac2f903451dba4d5f4ac010b2ae5bfcad0c4.camel@perches.com>
 <alpine.DEB.2.22.394.2008301021250.3629@hadrien>
 <bc3215bbf6c217a06dc2ebbf6ddd977c5d57654c.camel@perches.com>
 <alpine.DEB.2.22.394.2008301742400.3629@hadrien>
 <7ce009d5f538feae7a6a20e0bbecdf73d74ea9f9.camel@perches.com>
 <alpine.DEB.2.22.394.2008302039000.3629@hadrien>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 02 Sep 2020 22:48:02 +0200 (CEST)
X-Greylist: Delayed for 77:26:53 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Wed, 02 Sep 2020 22:48:00 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] transform oddity / bug ?
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

On Sun, 2020-08-30 at 20:41 +0200, Julia Lawall wrote:
> On Sun, 30 Aug 2020, Joe Perches wrote:
> > On Sun, 2020-08-30 at 17:46 +0200, Julia Lawall wrote:
> > > Unfortunately this does not work when the declaration
> > is comma terminated and not semicolon terminated.
[]
> I will have to look into it.  It should handle this sort of thing, but it
> is somewhat complex, because the declarations have to be split and this
> specific case may not be handled.

Thanks.  Hope you can get to look at that one day.

> One thing that is possible is to change only the variable name.  If there
> are not many occurrences, one could fix them up afterwards by hand.

And hi again Julia.

I've tried a few variations on finding uses of a function
argument that are not by specific named functions or with
local assignment of that function argument to another
variable without success.

For example:

ssize_t fn(struct device *dev, struct device_attribute *attr, char *buf)
{
*	char *orig = buf;
or
	int count;
...
*	count = local_static_func(some_struct *foo, buf);
}

where local_static_func is not sysfs_emit or sysfs_emit_at

Any clue you can offer?

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
