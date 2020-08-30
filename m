Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DBE256F34
	for <lists+cocci@lfdr.de>; Sun, 30 Aug 2020 17:53:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07UFrYZm018552;
	Sun, 30 Aug 2020 17:53:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 14EE077BC;
	Sun, 30 Aug 2020 17:53:34 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 4A3BF3F6C
 for <cocci@systeme.lip6.fr>; Sun, 30 Aug 2020 17:53:32 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0220.hostedemail.com
 [216.40.44.220])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07UFrUF5010837
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Sun, 30 Aug 2020 17:53:31 +0200 (CEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 50EF8100E7B45;
 Sun, 30 Aug 2020 15:53:29 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:69:355:379:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1461:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2110:2393:2559:2562:2693:2828:3138:3139:3140:3141:3142:3355:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:4362:4605:5007:6119:7903:7904:10004:10400:10450:10455:10848:11026:11232:11658:11914:12295:12296:12297:12663:12740:12760:12895:13156:13228:13439:14040:14659:14721:19904:19999:21080:21627:21740:21990:30029:30054:30070:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: scene09_461690e27088
X-Filterd-Recvd-Size: 3582
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Sun, 30 Aug 2020 15:53:28 +0000 (UTC)
Message-ID: <ecbc0cb17e84de030e9036b179511259ccd01f94.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 30 Aug 2020 08:53:27 -0700
In-Reply-To: <alpine.DEB.2.22.394.2008301742400.3629@hadrien>
References: <de28becbfe76575b18c0bf47567b7f9c20f15f87.camel@perches.com>
 <alpine.DEB.2.22.394.2008300854510.3629@hadrien>
 <b43fac2f903451dba4d5f4ac010b2ae5bfcad0c4.camel@perches.com>
 <alpine.DEB.2.22.394.2008301021250.3629@hadrien>
 <bc3215bbf6c217a06dc2ebbf6ddd977c5d57654c.camel@perches.com>
 <alpine.DEB.2.22.394.2008301742400.3629@hadrien>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 30 Aug 2020 17:53:34 +0200 (CEST)
X-Greylist: Delayed for 70:17:36 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Sun, 30 Aug 2020 17:53:31 +0200 (CEST)
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

On Sun, 2020-08-30 at 17:46 +0200, Julia Lawall wrote:
> [...]
> 
> > Thanks, I used the slightly different from your suggestion
> > where sysfs is an identifier with function args and a
> > semicolon after the transform type, (otherwise I get cocci errors).
> > like this below:
> > 
> > But it doesn't work (no renaming) when there is an
> > initializer to the variable to be transformed.
> > 
> > ie:
> > {
> > 	ssize_t count = 0;
> > 	...
> > 	count += sysfs_emit_at(buf, count, ...);
> > 	...
> > 	return count;
> > }
> > 
> > I tried adding =0 in various places without success.
> > 
> > Suggestions?
> > 
> > ------------------
> > 
> > // Rename the sysfs_emit assigned variables not named len and not already int
> > // and set the name to len and type to int
> > 
> > @not_int_not_len exists@
> > type T != int;
> > identifier x != len;
> > position p;
> > identifier sysfs =~ "^sysfs_emit.*$";
> > assignment operator aop;
> > @@
> > 
> > T x@p;
> > ...
> > x aop sysfs(...)
> > ...
> > 
> > @@
> > type not_int_not_len.T;
> > identifier not_int_not_len.x;
> > position not_int_not_len.p;
> > @@
> > 
> > - T x@p;
> > + int len;
> >   <...
> > - x
> > + len
> >   ...>
> > 
> > ------------------
> 
> The following:
> 
> @not_int_not_len exists@
> type T != int;
> identifier x != len;
> position p;
> identifier sysfs =~ "^sysfs_emit.*$";
> assignment operator aop;
> @@
> 
> T@p x;
> ...
> x aop sysfs(...)
> 
> @@
> type not_int_not_len.T;
> identifier not_int_not_len.x;
> position not_int_not_len.p;
> @@
> 
> (
> - T@p x;
> + int len;
> - T@p x
> + int len
>  = ...;
> )
>   <...
> - x
> + len
>   ...>
> 
> works on the following test file:
> 
> int fn1()
> {
>         ssize_t count = 0;
>         count += sysfs_emit_at(buf, count, ...);
>         return count;
> }
> 
> int fn2()
> {
>         ssize_t count;
>         count += sysfs_emit_at(buf, count, ...);
> 	return count;
> }
> 
> In the first rule, T@p x; benefits from an isomorphism to get the
> initialization case.  That is not possible in the second rule, because the
> name of the declared variable is modified.
> 
> I wonder why you use a regular expression for the sysfs identifier.  I
> thought that there were only two choices?  You will get better performance
> if you make those two choices explicit in the rule, with \( \| \).

Just because I'm accustomed to regex.  I'll change it,
Thanks for all the comments and corrections.

cheers, Joe


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
