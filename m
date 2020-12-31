Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFEA2E81FA
	for <lists+cocci@lfdr.de>; Thu, 31 Dec 2020 21:42:19 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BVKfqnR009515;
	Thu, 31 Dec 2020 21:41:52 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8573E77D5;
	Thu, 31 Dec 2020 21:41:52 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id CFCFA373F
 for <cocci@systeme.lip6.fr>; Thu, 31 Dec 2020 21:41:50 +0100 (CET)
Received: from smtprelay.hostedemail.com (smtprelay0160.hostedemail.com
 [216.40.44.160])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 0BVKfkcK028422
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Thu, 31 Dec 2020 21:41:48 +0100 (CET)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 6DEDC100E7B44;
 Thu, 31 Dec 2020 20:41:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:982:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2689:2693:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:4362:5007:6119:7652:7903:10004:10400:10848:11026:11232:11658:11914:12043:12050:12294:12296:12297:12438:12663:12740:12760:12895:13069:13311:13357:13439:14180:14181:14659:14721:21080:21433:21451:21627:21740:21990:30054:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: scarf83_56008ba274b0
X-Filterd-Recvd-Size: 2201
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Thu, 31 Dec 2020 20:41:44 +0000 (UTC)
Message-ID: <eaa30016de67722c9595c3233b32b94474280a0a.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 31 Dec 2020 12:41:43 -0800
In-Reply-To: <alpine.DEB.2.22.394.2012312124290.20387@hadrien>
References: <58a84d03b714f71d231f9cac04af09a6b97c6f04.camel@perches.com>
 <cc5722eb472a0a94f3418f6081b10f3c4a7e156d.camel@perches.com>
 <alpine.DEB.2.22.394.2012312124290.20387@hadrien>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 31 Dec 2020 21:41:52 +0100 (CET)
X-Greylist: Delayed for 00:28:14 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Thu, 31 Dec 2020 21:41:48 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] cocci: missed strlcpy->strscpy conversion?
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

On Thu, 2020-12-31 at 21:27 +0100, Julia Lawall wrote:
> On Thu, 31 Dec 2020, Joe Perches wrote:
> > On Thu, 2020-12-31 at 11:04 -0800, Joe Perches wrote:
> > > strlcpy is deprecated.  see: Documentation/process/deprecated.rst
> > > 
> > > Change the calls that do not use the strlcpy return value to the
> > > preferred strscpy.
> > > 
> > > Done with cocci script:
> > > 
> > > @@
> > > expression e1, e2, e3;
> > > @@
> > > 
> > > -	strlcpy(
> > > +	strscpy(
> > > 	e1, e2, e3);
> > > 
> > > This cocci script leaves the instances where the return value is
> > > used unchanged.
> > 
> > Hey Julia.
> > 
> > After using the cocci script above on a test treewide conversion,
> > there were a few instances with no return use that were not converted.
> > 
> > Any idea why these were not converted?
[]
> The parse is not happy about the for_each_possible_cpu.  It seems that the
> heuristic for detecting that as a loop expects that the body of the loop
> will have braces.  You can see this with the --parse-c option, ie
> 
> spatch --parse-c drivers/block/rnbd/rnbd-clt.c
> 
> The offending line will have BAD in front of it.

Thanks.

Do you consider the for_each heuristic a defect? (I'm not sure I do)

I hope it's time for you to stop working today...

cheers and happy new year,  Joe

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
