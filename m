Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA92425E9A6
	for <lists+cocci@lfdr.de>; Sat,  5 Sep 2020 20:15:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 085IFBe9012442;
	Sat, 5 Sep 2020 20:15:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BB31677BC;
	Sat,  5 Sep 2020 20:15:11 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 4E6DD6717
 for <cocci@systeme.lip6.fr>; Sat,  5 Sep 2020 20:15:10 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0126.hostedemail.com
 [216.40.44.126])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 085IF9k7012160
 for <cocci@systeme.lip6.fr>; Sat, 5 Sep 2020 20:15:09 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 10081181CB152
 for <cocci@systeme.lip6.fr>; Sat,  5 Sep 2020 17:58:36 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 1EF071E01;
 Sat,  5 Sep 2020 17:58:32 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:800:960:968:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2197:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3653:3865:3867:3868:3872:3874:4321:5007:10004:10400:10848:11658:11914:12043:12296:12297:12555:12760:13019:13069:13161:13229:13311:13357:13439:14093:14097:14181:14394:14659:14721:21080:21221:21451:21627:30054:30070,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: earth46_3514226270bc
X-Filterd-Recvd-Size: 2360
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Sat,  5 Sep 2020 17:58:30 +0000 (UTC)
Message-ID: <afc2cffdd315d3e4394af149278df9e8af7f49f4.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 05 Sep 2020 10:58:29 -0700
In-Reply-To: <20200901094812.428896-1-efremov@linux.com>
References: <20200811210127.11889-1-efremov@linux.com>
 <20200901094812.428896-1-efremov@linux.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 05 Sep 2020 20:15:12 +0200 (CEST)
X-Greylist: Delayed for 42:39:11 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Sat, 05 Sep 2020 20:15:09 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Kees Cook <keescook@chromium.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH] checkpatch: Warn on self-assignments
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

The uninitialized_var() macro was removed recently via
commit 63a0895d960a ("compiler: Remove uninitialized_var() macro")
as it's not a particularly useful warning and its use can
"paper over real bugs".

Add a checkpatch test to warn on self-assignments as a means
to avoid compiler warnings and as a back-door mechanism to
reproduce the old uninitialized_var macro behavior.

Signed-off-by: Joe Perches <joe@perches.com>
---
 scripts/checkpatch.pl | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 149518d2a6a7..300b2659aab3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3901,6 +3901,17 @@ sub process {
 #ignore lines not being added
 		next if ($line =~ /^[^\+]/);
 
+# check for self assigments used to avoid compiler warnings
+# e.g.:	int foo = foo, *bar = NULL;
+#	struct foo bar = *(&(bar));
+		if ($line =~ /^\+\s*(?:$Declare)?([A-Za-z_][A-Za-z\d_]*)\s*=/) {
+			my $var = $1;
+			if ($line =~ /^\+\s*(?:$Declare)?$var\s*=\s*(?:$var|\*\s*\(?\s*&\s*\(?\s*$var\s*\)?\s*\)?)\s*[;,]/) {
+				WARN("SELF_ASSIGNMENT",
+				     "Do not use self-assignments to avoid compiler warnings\n" . $herecurr);
+			}
+		}
+
 # check for dereferences that span multiple lines
 		if ($prevline =~ /^\+.*$Lval\s*(?:\.|->)\s*$/ &&
 		    $line =~ /^\+\s*(?!\#\s*(?!define\s+|if))\s*$Lval/) {



_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
