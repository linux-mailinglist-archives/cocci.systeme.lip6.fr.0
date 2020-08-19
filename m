Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C679924AF17
	for <lists+cocci@lfdr.de>; Thu, 20 Aug 2020 08:13:59 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07K6DSb4019676;
	Thu, 20 Aug 2020 08:13:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 59BD977BC;
	Thu, 20 Aug 2020 08:13:28 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B4519428B
 for <cocci@systeme.lip6.fr>; Thu, 20 Aug 2020 08:13:26 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0123.hostedemail.com
 [216.40.44.123])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07K6DMBa012701
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Thu, 20 Aug 2020 08:13:23 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 3225E1802851E
 for <cocci@systeme.lip6.fr>; Wed, 19 Aug 2020 23:07:29 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 9A0AF181D3030;
 Wed, 19 Aug 2020 23:07:25 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3866:3867:3870:3871:3872:3874:4321:5007:7903:7974:9010:10004:10400:10471:10848:11026:11232:11658:11914:12043:12296:12297:12438:12740:12760:12895:13069:13071:13255:13311:13357:13439:14096:14097:14180:14181:14659:14721:21060:21080:21627:21740:21990:30054:30056:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: veil80_52063782702b
X-Filterd-Recvd-Size: 2464
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Wed, 19 Aug 2020 23:07:24 +0000 (UTC)
Message-ID: <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Julia Lawall
 <julia.lawall@lip6.fr>, cocci <cocci@systeme.lip6.fr>
Date: Wed, 19 Aug 2020 16:07:23 -0700
In-Reply-To: <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 20 Aug 2020 08:13:31 +0200 (CEST)
X-Greylist: Delayed for 07:05:54 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Thu, 20 Aug 2020 08:13:23 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: Giuseppe Scrivano <gscrivan@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>
Subject: [Cocci] coccinelle: Convert comma to semicolons (was Re: [PATCH]
 checkpatch: Add test for comma use that should be semicolon)
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

On Wed, 2020-08-19 at 14:22 -0700, Joe Perches wrote:
> There are commas used as statement terminations that should typically
> have used semicolons instead.  Only direct assignments or use of a single
> function or value on a single line are detected by this test.
> 
> e.g.:
> 	foo = bar(),		/* typical use is semicolon not comma */
> 	bar = baz();
> 
> Add an imperfect test to detect these comma uses.
> 
> No false positives were found in testing, but many types of false negatives
> are possible.
> 
> e.g.:
> 	foo = bar() + 1,	/* comma use, but not direct assignment */
> 	bar = baz();

Hi.

I recently added a test for this condition to linux's checkpatch.

A similar coccinelle script might be:

$ cat comma.cocci
@@
expression e1;
expression e2;
@@

	e1
-	,
+	;
	e2;
$

This works reasonably well but it has several false positives
for declarations like:

$ spatch --sp-file comma.cocci mm/huge_memory.c
diff -u -p a/huge_memory.c b/huge_memory.c
--- a/huge_memory.c
+++ b/huge_memory.c
@@ -2778,7 +2778,7 @@ static unsigned long deferred_split_scan
 	struct pglist_data *pgdata = NODE_DATA(sc->nid);
 	struct deferred_split *ds_queue = &pgdata->deferred_split_queue;
 	unsigned long flags;
-	LIST_HEAD(list), *pos, *next;
+	LIST_HEAD(list), *pos; *next;
 	struct page *page;
 	int split = 0;
$

Any script improvement suggestions?


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
