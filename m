Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C81E23EEA8
	for <lists+cocci@lfdr.de>; Fri,  7 Aug 2020 16:08:16 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 077E7pUk022492;
	Fri, 7 Aug 2020 16:07:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D46A077BC;
	Fri,  7 Aug 2020 16:07:51 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id DC0044084
 for <cocci@systeme.lip6.fr>; Fri,  7 Aug 2020 16:07:49 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 077E7liE011714
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Fri, 7 Aug 2020 16:07:48 +0200 (CEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0689522CF6;
 Fri,  7 Aug 2020 14:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596809267;
 bh=EyhdrNR9ecLwjRnvHIIjWGUTnkfvO9ZqKxIScy65X98=;
 h=Subject:To:Cc:From:Date:From;
 b=EPabNIipr/KdQOU5Mg33JkcV1yTOUk2ikhrTBLtcUKtrMrkBeO+nL9NUxFGd5nH1+
 EGiTe++fMtsALGrmcJ7dPJmvra/owSrhZIw0bZ9DpP3ettIg9kxaXUV4nxkIMZ/Jop
 kZCYOLIjvxV5JRLBu08Hedq1fmFzZXdf4KEAzpx4=
To: cocci@systeme.lip6.fr, gregkh@linuxfoundation.org, jeyu@kernel.org,
        julia.lawall@inria.fr, maennich@google.com, skhan@linuxfoundation.org,
        yuehaibing@huawei.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 07 Aug 2020 16:04:11 +0200
Message-ID: <1596809051140121@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 07 Aug 2020 16:07:52 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 07 Aug 2020 16:07:49 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: stable-commits@vger.kernel.org
Subject: [Cocci] Patch "scripts: add dummy report mode to
	add_namespace.cocci" has been added to the 5.7-stable tree
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


This is a note to let you know that I've just added the patch titled

    scripts: add dummy report mode to add_namespace.cocci

to the 5.7-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     scripts-add-dummy-report-mode-to-add_namespace.cocci.patch
and it can be found in the queue-5.7 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 55c7549819e438f40a3ef1d8ac5c38b73390bcb7 Mon Sep 17 00:00:00 2001
From: Matthias Maennich <maennich@google.com>
Date: Thu, 4 Jun 2020 18:41:45 +0200
Subject: scripts: add dummy report mode to add_namespace.cocci

From: Matthias Maennich <maennich@google.com>

commit 55c7549819e438f40a3ef1d8ac5c38b73390bcb7 upstream.

When running `make coccicheck` in report mode using the
add_namespace.cocci file, it will fail for files that contain
MODULE_LICENSE. Those match the replacement precondition, but spatch
errors out as virtual.ns is not set.

In order to fix that, add the virtual rule nsdeps and only do search and
replace if that rule has been explicitly requested.

In order to make spatch happy in report mode, we also need a dummy rule,
as otherwise it errors out with "No rules apply". Using a script:python
rule appears unrelated and odd, but this is the shortest I could come up
with.

Adjust scripts/nsdeps accordingly to set the nsdeps rule when run trough
`make nsdeps`.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Fixes: c7c4e29fb5a4 ("scripts: add_namespace: Fix coccicheck failed")
Cc: YueHaibing <yuehaibing@huawei.com>
Cc: jeyu@kernel.org
Cc: cocci@systeme.lip6.fr
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Maennich <maennich@google.com>
Reported-by: Shuah Khan <skhan@linuxfoundation.org>
Acked-by: Julia Lawall <julia.lawall@inria.fr>
Link: https://lore.kernel.org/r/20200604164145.173925-1-maennich@google.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 scripts/coccinelle/misc/add_namespace.cocci |    8 +++++++-
 scripts/nsdeps                              |    2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

--- a/scripts/coccinelle/misc/add_namespace.cocci
+++ b/scripts/coccinelle/misc/add_namespace.cocci
@@ -6,6 +6,7 @@
 /// add a missing namespace tag to a module source file.
 ///
 
+virtual nsdeps
 virtual report
 
 @has_ns_import@
@@ -16,10 +17,15 @@ MODULE_IMPORT_NS(ns);
 
 // Add missing imports, but only adjacent to a MODULE_LICENSE statement.
 // That ensures we are adding it only to the main module source file.
-@do_import depends on !has_ns_import@
+@do_import depends on !has_ns_import && nsdeps@
 declarer name MODULE_LICENSE;
 expression license;
 identifier virtual.ns;
 @@
 MODULE_LICENSE(license);
 + MODULE_IMPORT_NS(ns);
+
+// Dummy rule for report mode that would otherwise be empty and make spatch
+// fail ("No rules apply.")
+@script:python depends on report@
+@@
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -29,7 +29,7 @@ fi
 
 generate_deps_for_ns() {
 	$SPATCH --very-quiet --in-place --sp-file \
-		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D ns=$1 $2
+		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D nsdeps -D ns=$1 $2
 }
 
 generate_deps() {


Patches currently in stable-queue which might be from maennich@google.com are

queue-5.7/scripts-add-dummy-report-mode-to-add_namespace.cocci.patch
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
