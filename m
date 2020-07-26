Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D542322DF57
	for <lists+cocci@lfdr.de>; Sun, 26 Jul 2020 14:54:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06QCrEwj017419;
	Sun, 26 Jul 2020 14:53:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8A1453F6C;
	Sun, 26 Jul 2020 14:53:14 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 215D13F6C
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:53:12 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06QCrBaY001959
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:53:11 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 7BE7F29A07B
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Sun, 26 Jul 2020 18:21:40 +0530
Message-Id: <20200726125141.17787-43-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200726125141.17787-1-jaskaran.singh@collabora.com>
References: <20200726125141.17787-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:53:14 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:53:11 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 42/43] tests: Add test case to match meta attribute
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

Meta attributes are added to SmPL. Add test case to match and detect a
meta attribute in C code.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 tests/metaattr.c     | 5 +++++
 tests/metaattr.cocci | 9 +++++++++
 tests/metaattr.res   | 5 +++++
 3 files changed, 19 insertions(+)
 create mode 100644 tests/metaattr.c
 create mode 100644 tests/metaattr.cocci
 create mode 100644 tests/metaattr.res

diff --git a/tests/metaattr.c b/tests/metaattr.c
new file mode 100644
index 000000000..d3b091cd9
--- /dev/null
+++ b/tests/metaattr.c
@@ -0,0 +1,5 @@
+int main() {
+	int b __attr__ = 1;
+	int b = 1;
+	return 0;
+}
diff --git a/tests/metaattr.cocci b/tests/metaattr.cocci
new file mode 100644
index 000000000..a325ad06f
--- /dev/null
+++ b/tests/metaattr.cocci
@@ -0,0 +1,9 @@
+@@
+attribute name __attr__;
+attribute a;
+identifier b;
+@@
+
+-	int
++	char
+  b a = 1;
diff --git a/tests/metaattr.res b/tests/metaattr.res
new file mode 100644
index 000000000..9cd2014f2
--- /dev/null
+++ b/tests/metaattr.res
@@ -0,0 +1,5 @@
+int main() {
+	char b __attr__ = 1;
+	int b = 1;
+	return 0;
+}
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
