Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5D42E82B0
	for <lists+cocci@lfdr.de>; Fri,  1 Jan 2021 00:53:55 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BVNrSTg014478;
	Fri, 1 Jan 2021 00:53:28 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 95CD077D5;
	Fri,  1 Jan 2021 00:53:28 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id F1247373F
 for <cocci@systeme.lip6.fr>; Fri,  1 Jan 2021 00:53:26 +0100 (CET)
Received: from smtprelay.hostedemail.com (smtprelay0113.hostedemail.com
 [216.40.44.113])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0BVNrOoJ007122
 for <cocci@systeme.lip6.fr>; Fri, 1 Jan 2021 00:53:24 +0100 (CET)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 3C867181CAC61
 for <cocci@systeme.lip6.fr>; Thu, 31 Dec 2020 21:24:04 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 64D91100E7B43;
 Thu, 31 Dec 2020 21:24:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1567:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3866:3867:3870:3871:3872:3874:4321:5007:7652:8660:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13148:13161:13229:13230:13311:13357:13439:14659:14721:21080:21433:21627:21740:21939:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:34, LUA_SUMMARY:none
X-HE-Tag: sofa78_14019a2274b0
X-Filterd-Recvd-Size: 1372
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Thu, 31 Dec 2020 21:24:00 +0000 (UTC)
Message-ID: <a3279a5772b2e49b57890cd75e97360b82890798.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 31 Dec 2020 13:23:57 -0800
In-Reply-To: <alpine.DEB.2.22.394.2012312219520.20387@hadrien>
References: <58a84d03b714f71d231f9cac04af09a6b97c6f04.camel@perches.com>
 <cc5722eb472a0a94f3418f6081b10f3c4a7e156d.camel@perches.com>
 <alpine.DEB.2.22.394.2012312124290.20387@hadrien>
 <eaa30016de67722c9595c3233b32b94474280a0a.camel@perches.com>
 <alpine.DEB.2.22.394.2012312219520.20387@hadrien>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 01 Jan 2021 00:53:29 -878300 (CET)
X-Greylist: Delayed for 03:39:46 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Fri, 01 Jan 2021 00:53:25 -878300 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
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

On Thu, 2020-12-31 at 22:21 +0100, Julia Lawall wrote:
> It seems that the problem is not really the for_each, but the * in front
> of a "function call" on the left side of an assignment.  Without the *,
> everything is fine.  So it is indeed probably not worth doing anything
> about.

Maybe a combination because if braces are added to the for_each,
the conversion also works.


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
