Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2299256EFC
	for <lists+cocci@lfdr.de>; Sun, 30 Aug 2020 17:21:43 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07UFLHl0028599;
	Sun, 30 Aug 2020 17:21:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2620B77BC;
	Sun, 30 Aug 2020 17:21:17 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 31F383F6C
 for <cocci@systeme.lip6.fr>; Sun, 30 Aug 2020 17:21:15 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0145.hostedemail.com
 [216.40.44.145])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07UFLBHP020486
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Sun, 30 Aug 2020 17:21:12 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 55DB318352D5C
 for <cocci@systeme.lip6.fr>; Sun, 30 Aug 2020 15:21:09 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id B5088181D337B;
 Sun, 30 Aug 2020 15:21:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:69:355:379:599:960:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1544:1593:1594:1605:1711:1730:1747:1777:1792:2393:2553:2559:2562:2693:2828:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:4362:4605:5007:6119:7903:7904:8603:10004:10848:11026:11232:11658:11914:12295:12296:12297:12679:12740:12760:12895:13439:14659:14721:21080:21324:21627:21740:21990:30029:30030:30046:30054:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: cup37_021268627088
X-Filterd-Recvd-Size: 4970
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Sun, 30 Aug 2020 15:21:04 +0000 (UTC)
Message-ID: <bc3215bbf6c217a06dc2ebbf6ddd977c5d57654c.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 30 Aug 2020 08:21:03 -0700
In-Reply-To: <alpine.DEB.2.22.394.2008301021250.3629@hadrien>
References: <de28becbfe76575b18c0bf47567b7f9c20f15f87.camel@perches.com>
 <alpine.DEB.2.22.394.2008300854510.3629@hadrien>
 <b43fac2f903451dba4d5f4ac010b2ae5bfcad0c4.camel@perches.com>
 <alpine.DEB.2.22.394.2008301021250.3629@hadrien>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 30 Aug 2020 17:21:18 +0200 (CEST)
X-Greylist: Delayed for 65:02:51 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Sun, 30 Aug 2020 17:21:12 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
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

On Sun, 2020-08-30 at 10:27 +0200, Julia Lawall wrote:
> 
> On Sun, 30 Aug 2020, Joe Perches wrote:
> 
> > On Sun, 2020-08-30 at 08:57 +0200, Julia Lawall wrote:
> > > On Sat, 29 Aug 2020, Joe Perches wrote:
> > > 
> > > > Is it me not understanding cocci grammar again?
> > > 
> > > The problem is the loop.  You are trying to change something in the body
> > > of a loop and the body of a for loop might not be executed.  ... means
> > > that the thing must be found on every execution path.
> > > 
> > > Do you want to make the change in the function header even if there are
> > > not changes in the body?  If so, <... ...> is what you are looking for.
> > > If you want to be sure there is a change to make in the function body then
> > > you can use <+... ...+> but it will be more expensive.
> > 
> > Thanks.  <... works (and I thought I had tried that, oh well)
> > 
> > Another thing I'd like to do is to change the various uses
> > of a type and identifier to a specific type and identifier.
> > 
> > In this sysfs_emit transform I've been working on, there
> > are many variable names used in the assignment of the
> > sysfs_emit result.
> > 
> > $ git grep -P -oh '\w+\s*\+?=\s*sysfs_emit' | \
> >   sort | uniq -c | sort -rn
> >     145 ret = sysfs_emit
> >      80 len = sysfs_emit
> >      74 len += sysfs_emit
> >      69 rc = sysfs_emit
> >      50 count = sysfs_emit
> >      25 count += sysfs_emit
> >      19 size = sysfs_emit
> >      17 n += sysfs_emit
> >      15 n = sysfs_emit
> >      14 status = sysfs_emit
> >      12 ret += sysfs_emit
> >      12 output_len += sysfs_emit
> >      11 retval = sysfs_emit
> >       9 res += sysfs_emit
> >       7 rv = sysfs_emit
> >       7 offset += sysfs_emit
> >       7 l = sysfs_emit
> >       6 i = sysfs_emit
> >       5 size += sysfs_emit
> >       5 err = sysfs_emit
> >       4 written = sysfs_emit
> >       4 l += sysfs_emit
> >       3 written += sysfs_emit
> >       2 rz = sysfs_emit
> >       2 r = sysfs_emit
> >       2 result = sysfs_emit
> >       2 res = sysfs_emit
> >       2 i += sysfs_emit
> >       2 idx += sysfs_emit
> >       2 error = sysfs_emit
> >       2 cnt += sysfs_emit
> >       2 buf_len += sysfs_emit
> >       1 offset = sysfs_emit
> >       1 length = sysfs_emit
> >       1 cnt = sysfs_emit
> >       1 bytes = sysfs_emit
> >       1 bytes += sysfs_emit
> > 
> > Most are declared int, some are ssize_t.
> > 
> > I'd like to change them all to int len.
> 
> @r exists@
> type T != int;
> identifier x != len;
> position p;
> assignment operator aop;
> @@
> 
> T x@p;
> ...
> x aop sysfs_emit
> 
> @@
> type r.T;
> identifier r.x;
> position r.p;
> @@
> 
> - T x@p;
> + int len
>   <...
> - x
> + len
>   ...>
> 
> This only works for the case where the type is not int and the name is not
> len.  You would need other similar pairs of rules for the case where the
> type is int and the variable is something else and where the type is len
> and the variable is len.

Thanks, I used the slightly different from your suggestion
where sysfs is an identifier with function args and a
semicolon after the transform type, (otherwise I get cocci errors).
like this below:

But it doesn't work (no renaming) when there is an
initializer to the variable to be transformed.

ie:
{
	ssize_t count = 0;
	...
	count += sysfs_emit_at(buf, count, ...);
	...
	return count;
}

I tried adding =0 in various places without success.

Suggestions?

------------------

// Rename the sysfs_emit assigned variables not named len and not already int
// and set the name to len and type to int

@not_int_not_len exists@
type T != int;
identifier x != len;
position p;
identifier sysfs =~ "^sysfs_emit.*$";
assignment operator aop;
@@

T x@p;
...
x aop sysfs(...)
...

@@
type not_int_not_len.T;
identifier not_int_not_len.x;
position not_int_not_len.p;
@@

- T x@p;
+ int len;
  <...
- x
+ len
  ...>

------------------


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
