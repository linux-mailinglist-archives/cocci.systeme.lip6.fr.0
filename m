Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 152D2256F87
	for <lists+cocci@lfdr.de>; Sun, 30 Aug 2020 19:34:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07UHXgMO001897;
	Sun, 30 Aug 2020 19:33:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 04DAB77BC;
	Sun, 30 Aug 2020 19:33:42 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 551C23F6C
 for <cocci@systeme.lip6.fr>; Sun, 30 Aug 2020 19:33:40 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0252.hostedemail.com
 [216.40.44.252])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07UHXcUv029394
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Sun, 30 Aug 2020 19:33:39 +0200 (CEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 49602181D337B;
 Sun, 30 Aug 2020 17:33:37 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1461:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3874:4321:4605:5007:7875:7904:9121:9391:10004:10400:10848:11026:11232:11658:11914:12043:12297:12555:12679:12740:12760:12895:12986:13069:13156:13228:13311:13357:13439:14040:14096:14097:14181:14659:14721:21080:21627:21740:21990:30029:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: chess86_4910bc027088
X-Filterd-Recvd-Size: 2854
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Sun, 30 Aug 2020 17:33:36 +0000 (UTC)
Message-ID: <7ce009d5f538feae7a6a20e0bbecdf73d74ea9f9.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Date: Sun, 30 Aug 2020 10:33:35 -0700
In-Reply-To: <alpine.DEB.2.22.394.2008301742400.3629@hadrien>
References: <de28becbfe76575b18c0bf47567b7f9c20f15f87.camel@perches.com>
 <alpine.DEB.2.22.394.2008300854510.3629@hadrien>
 <b43fac2f903451dba4d5f4ac010b2ae5bfcad0c4.camel@perches.com>
 <alpine.DEB.2.22.394.2008301021250.3629@hadrien>
 <bc3215bbf6c217a06dc2ebbf6ddd977c5d57654c.camel@perches.com>
 <alpine.DEB.2.22.394.2008301742400.3629@hadrien>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 30 Aug 2020 19:33:43 +0200 (CEST)
X-Greylist: Delayed for 21:55:20 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Sun, 30 Aug 2020 19:33:39 +0200 (CEST)
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

Unfortunately this does not work when the declaration
is comma terminated and not semicolon terminated.


$ cat julia.c
int fn1()
{
        ssize_t count = 0, another;	// <- multiple declarations
        count += sysfs_emit_at(buf, count, ...);
        return count;
}

int fn2()
{
        ssize_t count;
        count += sysfs_emit_at(buf, count, ...);
        return count;
}

$ spatch -sp-file julia.cocci julia.c
init_defs_builtins: /usr/local/bin/../lib/coccinelle/standard.h
HANDLING: julia.c
diff = 
--- julia.c
+++ /tmp/cocci-output-77064-888900-julia.c
@@ -7,8 +7,8 @@ int fn1()
 
 int fn2()
 {
-        ssize_t count;
-        count += sysfs_emit_at(buf, count, ...);
-        return count;
+        int len;
+        len += sysfs_emit_at(buf, count, ...);
+        return len;
 }


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
