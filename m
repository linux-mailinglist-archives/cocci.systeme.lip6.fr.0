Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D80364B8A
	for <lists+cocci@lfdr.de>; Mon, 19 Apr 2021 22:46:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 13JKjO9E022172;
	Mon, 19 Apr 2021 22:45:25 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D290F77DD;
	Mon, 19 Apr 2021 22:45:24 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 546A23BA2
 for <cocci@systeme.lip6.fr>; Mon, 19 Apr 2021 22:45:22 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 13JKjLq9006716
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 19 Apr 2021 22:45:21 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AyxeUNqxKDhwB/4lm/b6yKrPw571zdoIgy1kn?=
 =?us-ascii?q?xilNYDZeG/b0q+mFmvMH2RjozAsLUHY7ltyafIWGS3XQ9Zl6iLNhXouKcQH6tA?=
 =?us-ascii?q?KTQ71KwpDlx1TbcBHW0s54+eNef7NlCNv2ZGIbse/f7BOjG9gthPmLmZrHuc7k?=
 =?us-ascii?q?w31gTR5nZshbhm9EIzyGGU57ThQuP/YEPaebj/AsmxOQPVAebsG2HRA+PtT+mw?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,235,1613430000"; d="scan'208";a="379100915"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-SHA;
 19 Apr 2021 22:45:20 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Julia Lawall <Julia.Lawall@inria.fr>
Date: Mon, 19 Apr 2021 21:58:07 +0200
Message-Id: <20210419195807.2362029-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 19 Apr 2021 22:45:28 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 19 Apr 2021 22:45:21 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>,
        linux-kernel@vger.kernel.org,
        "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
        cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH] Coccinelle: drop context *s
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

Context mode is not supported, so the *s are just confusing to people
who use the rule outside of make coccicheck.  So, drop the *s.

Fixes: 6dd9379e8f32 ("coccinelle: also catch kzfree() issues")
Reported-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 scripts/coccinelle/free/kfree.cocci |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/coccinelle/free/kfree.cocci b/scripts/coccinelle/free/kfree.cocci
index 168568386034..9b6e2037c2a9 100644
--- a/scripts/coccinelle/free/kfree.cocci
+++ b/scripts/coccinelle/free/kfree.cocci
@@ -22,9 +22,9 @@ position p1;
 @@
 
 (
-* kfree@p1(E)
+ kfree@p1(E)
 |
-* kfree_sensitive@p1(E)
+ kfree_sensitive@p1(E)
 )
 
 @print expression@
@@ -66,9 +66,9 @@ position ok;
 
 while (1) { ...
 (
-* kfree@ok(E)
+ kfree@ok(E)
 |
-* kfree_sensitive@ok(E)
+ kfree_sensitive@ok(E)
 )
   ... when != break;
       when != goto l;
@@ -84,9 +84,9 @@ position free.p1!=loop.ok,p2!={print.p,sz.p};
 @@
 
 (
-* kfree@p1(E,...)
+ kfree@p1(E,...)
 |
-* kfree_sensitive@p1(E,...)
+ kfree_sensitive@p1(E,...)
 )
 ...
 (

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
