Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F8D292A8D
	for <lists+cocci@lfdr.de>; Mon, 19 Oct 2020 17:36:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09JFaJp1003539;
	Mon, 19 Oct 2020 17:36:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 01A7B77BF;
	Mon, 19 Oct 2020 17:36:19 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7AC96445E
 for <cocci@systeme.lip6.fr>; Mon, 19 Oct 2020 17:36:17 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0041.hostedemail.com
 [216.40.44.41])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 09JFaF9Y001687
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Mon, 19 Oct 2020 17:36:16 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id D96A51801D454
 for <cocci@systeme.lip6.fr>; Mon, 19 Oct 2020 15:36:13 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id A53371802912E;
 Mon, 19 Oct 2020 15:36:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 64, 4, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:800:960:968:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2197:2199:2332:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3653:3865:3866:3867:3868:3871:4321:4823:5007:10004:10400:10848:11026:11232:11658:11914:12043:12050:12297:12555:12760:13069:13095:13161:13229:13311:13357:13439:14181:14394:14659:14721:21080:21221:21433:21627:21990:30054:30070,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: push29_4a1543e27238
X-Filterd-Recvd-Size: 2415
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Mon, 19 Oct 2020 15:36:09 +0000 (UTC)
Message-ID: <d9ea654104d55f590fb97d252d64a66b23c1a096.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 19 Oct 2020 08:36:08 -0700
In-Reply-To: <alpine.DEB.2.22.394.2010172016370.9440@hadrien>
References: <20201017160928.12698-1-trix@redhat.com>
 <f530b7aeecbbf9654b4540cfa20023a4c2a11889.camel@perches.com>
 <alpine.DEB.2.22.394.2010172016370.9440@hadrien>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 19 Oct 2020 17:36:19 +0200 (CEST)
X-Greylist: Delayed for 44:00:18 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Mon, 19 Oct 2020 17:36:16 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: trix@redhat.com, linux-kernel@vger.kernel.org,
        cocci <cocci@systeme.lip6.fr>
Subject: [Cocci] [PATCH V2] checkpatch: Allow --fix removal of unnecessary
 break statements
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

switch/case use of break after a return, goto or break is unnecessary.

There is an existing warning for the return and goto uses, so add
break and a --fix option too.

Signed-off-by: Joe Perches <joe@perches.com>
---

v2: Add break to matched keyword
    and change the message to show the matched keyword
 
For today's next, this would remove ~300 instances like:

	case FOO:
		return bar;
		break;
or
	case FOO:
		goto bar;
		break;

 scripts/checkpatch.pl | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..b0597853c16e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3674,12 +3674,16 @@ sub process {
 		}
 
 # check indentation of a line with a break;
-# if the previous line is a goto or return and is indented the same # of tabs
+# if the previous line is a goto, return or break
+# and is indented the same # of tabs
 		if ($sline =~ /^\+([\t]+)break\s*;\s*$/) {
 			my $tabs = $1;
-			if ($prevline =~ /^\+$tabs(?:goto|return)\b/) {
-				WARN("UNNECESSARY_BREAK",
-				     "break is not useful after a goto or return\n" . $hereprev);
+			if ($prevline =~ /^\+$tabs(goto|return|break)\b/) {
+				if (WARN("UNNECESSARY_BREAK",
+					 "break is not useful after a $1\n" . $hereprev) &&
+				    $fix) {
+					fix_delete_line($fixlinenr, $rawline);
+				}
 			}
 		}
 


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
