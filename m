Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D9C9C79F
	for <lists+cocci@lfdr.de>; Mon, 26 Aug 2019 05:16:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7Q3GCPM006876;
	Mon, 26 Aug 2019 05:16:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B84287798;
	Mon, 26 Aug 2019 05:16:12 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 650094317
 for <cocci@systeme.lip6.fr>; Mon, 26 Aug 2019 05:16:09 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0219.hostedemail.com
 [216.40.44.219])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTP id x7Q3G7Wa017022
 for <cocci@systeme.lip6.fr>; Mon, 26 Aug 2019 05:16:07 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 35857800CAE5
 for <cocci@systeme.lip6.fr>; Sun, 25 Aug 2019 16:37:39 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 5AFFB18029122;
 Sun, 25 Aug 2019 16:37:36 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::,
 RULES_HIT:41:355:379:599:960:973:981:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:1801:2197:2199:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3354:3622:3653:3865:3866:3867:3868:3870:3871:3872:4321:4605:5007:6117:6119:6691:7875:7903:9121:10004:10400:10848:11026:11232:11233:11473:11658:11914:12043:12296:12297:12438:12555:12679:12740:12760:12895:12986:13439:13548:14181:14659:14721:21080:21221:21451:21611:21627:30012:30054:30070:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:27,
 LUA_SUMMARY:none
X-HE-Tag: shock46_80224e1ebd25
X-Filterd-Recvd-Size: 3578
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Sun, 25 Aug 2019 16:37:34 +0000 (UTC)
Message-ID: <b5bae2981e27d133b61d99b08ee60244bf7aabe3.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Denis Efremov <efremov@linux.com>, cocci@systeme.lip6.fr
Date: Sun, 25 Aug 2019 09:37:32 -0700
In-Reply-To: <20190825130536.14683-1-efremov@linux.com>
References: <20190825130536.14683-1-efremov@linux.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 26 Aug 2019 05:16:15 +0200 (CEST)
X-Greylist: Delayed for 05:50:00 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Mon, 26 Aug 2019 05:16:08 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] scripts: coccinelle: check for !(un)?likely
	usage
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

On Sun, 2019-08-25 at 16:05 +0300, Denis Efremov wrote:
> This patch adds coccinelle script for detecting !likely and !unlikely
> usage. It's better to use unlikely instead of !likely and vice versa.

Please explain _why_ is it better in the changelog.

btw: there are relatively few uses like this in the kernel.

$ git grep -P '!\s*(?:un)?likely\s*\(' | wc -l
40

afaict: It may save 2 bytes of x86/64 object code.

For instance:

$ diff -urN kernel/tsacct.lst.old kernel/tsacct.lst.new|less
--- kernel/tsacct.lst.old       2019-08-25 09:21:39.936570183 -0700
+++ kernel/tsacct.lst.new       2019-08-25 09:22:20.774324886 -0700
@@ -24,158 +24,153 @@
   15:  48 89 fb                mov    %rdi,%rbx
        u64 time, delta;
 
-       if (!likely(tsk->mm))
+       if (unlikely(tsk->mm))
   18:  4c 8d ab 28 02 00 00    lea    0x228(%rbx),%r13
   1f:  e8 00 00 00 00          callq  24 <__acct_update_integrals+0x24>
                        20: R_X86_64_PLT32      __sanitizer_cov_trace_pc-0x4
   24:  4c 89 ef                mov    %r13,%rdi
   27:  e8 00 00 00 00          callq  2c <__acct_update_integrals+0x2c>
                        28: R_X86_64_PLT32      __asan_load8_noabort-0x4
-  2c:  4c 8b bb 28 02 00 00    mov    0x228(%rbx),%r15
-  33:  4d 85 ff                test   %r15,%r15
-  36:  74 34                   je     6c <__acct_update_integrals+0x6c>
+  2c:  48 83 bb 28 02 00 00    cmpq   $0x0,0x228(%rbx)
+  33:  00 
+  34:  75 34                   jne    6a <__acct_update_integrals+0x6a>
                return;

And here's a possible equivalent checkpatch test.
---
 scripts/checkpatch.pl | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 287fe73688f0..364603ad1a47 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6529,6 +6529,24 @@ sub process {
 			     "Using $1 should generally have parentheses around the comparison\n" . $herecurr);
 		}
 
+# !(likely|unlikely)(condition) use should be (unlikely|likely)(condition)
+		if ($perl_version_ok &&
+		    $line =~ /(\!\s*((?:un)?likely))\s*$balanced_parens/) {
+			my $match = $1;
+			my $type =  $2;
+			my $reverse;
+			if ($type eq "likely") {
+				$reverse = "unlikely";
+			} else {
+				$reverse = "likely";
+			}
+			if (WARN("LIKELY_MISUSE",
+				 "Prefer $reverse over $match\n" . $herecurr) &&
+			    $fix) {
+				$fixed[$fixlinenr] =~ s/\Q$match\E\s*\(/$reverse(/;
+			}
+		}
+
 # whine mightly about in_atomic
 		if ($line =~ /\bin_atomic\s*\(/) {
 			if ($realfile =~ m@^drivers/@) {


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
