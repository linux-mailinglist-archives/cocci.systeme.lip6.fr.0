Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C701E7CCE
	for <lists+cocci@lfdr.de>; Fri, 29 May 2020 14:10:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04TCAZrc006341;
	Fri, 29 May 2020 14:10:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 8386D7829;
	Fri, 29 May 2020 14:10:35 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E23567783
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:10:33 +0200 (CEST)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1033])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04TCAWAc019136
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:10:33 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id a45so1693587pje.1
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 05:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yNcRDX9hmzicpYrIzSR1d5L189a5/jLnt2HECCkQKP0=;
 b=LI6cIUnnpgApNxM/qu5Bjvyqlbabu8St7kHcDWutE2NoQjYTCtUGRXk/BYigEsvHCO
 iKVpCDCWw7M+w/CtN7RyTVWmwal/q1FxJBTSY08xAj7GePHMJvunad/xC+MEQwZ3ODrf
 ToESaKdJb+SLOs4QJD/jUjIVMX8QpNrg/w9tWyyFDwYyFbN8QXSHoEdliilUuUf7DdFt
 aM9ZkcDAlZNeHXCuWHcArTVDTvgbfiI7pJf3uGGFbAnD1i5Gaz7eJwfpZ+/kIPO6AUga
 GJA+Xu1He/9O0MhYHXkogq99OScal4fDSjBMfFozT8kAPYMvjGRdg6c1uL2S+Jp4dDot
 WG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yNcRDX9hmzicpYrIzSR1d5L189a5/jLnt2HECCkQKP0=;
 b=kOWqTrmpEPG48e4SwVjrVTN8pMxrFM9A8jcRteqYEoDT1kr2Os7Vf0HtsnJ3CukIC/
 iHjotJmDkXwYW7aT+PWMYob0hFV0K2PMKr88wE3FJcO0wnI1Wn38wCMdjWbef8s31f9R
 XwomwNCU5lhMRrMc9X6I9bG5eEOgMd25e+EHv1rBd0z3pwUTzwTC6haRHRxyXLWBqCfM
 GU/CQ/ZMVTyFZEILqLCHw67xZAklp7bRTN56SHgrRzFnPhvJvqrxDRUIAlSCqf0Cs2kX
 GyZyJMMBVYHk/QUgFvqSqhQCxPfGg5gUIZyHsw5Tn34ErRdgprm7UIlsXx6Bk/NOoUEI
 ps0A==
X-Gm-Message-State: AOAM532lRG4ljzIXKKX62uVeSnOjGn40qn8UN9bMz+Co2MeLNea1ymvB
 iKMzMudUuTBA7V8dADGOeCT1R21j
X-Google-Smtp-Source: ABdhPJy4pJ89KFMVySWYAnCuIytW0z6Hiv5mnLj59BMUOYIKwXwivmbJXoAC8Pxj0dnqdLtZbGUu1g==
X-Received: by 2002:a17:90a:8c95:: with SMTP id
 b21mr9325021pjo.89.1590754231375; 
 Fri, 29 May 2020 05:10:31 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:10:30 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:37:01 +0530
Message-Id: <20200529120703.31145-32-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 29 May 2020 14:10:35 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 29 May 2020 14:10:33 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 31/32] tests: Add test case to remove cast
	attributes
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

Add a test case to remove a cast attribute. The following cases are
covered for when a attribute is:

- Before the cast type.
- After the cast type.
- After the cast type and before the *.
- After the cast type and *.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/remove_cast_attr.c     | 10 ++++++++++
 tests/remove_cast_attr.cocci | 10 ++++++++++
 tests/remove_cast_attr.res   | 10 ++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 tests/remove_cast_attr.c
 create mode 100644 tests/remove_cast_attr.cocci
 create mode 100644 tests/remove_cast_attr.res

diff --git a/tests/remove_cast_attr.c b/tests/remove_cast_attr.c
new file mode 100644
index 00000000..4f6da3e4
--- /dev/null
+++ b/tests/remove_cast_attr.c
@@ -0,0 +1,10 @@
+#define __cast_attr MACROANNOTATION
+
+int func()
+{
+	int *a = (int __cast_attr) x;
+	int *a = (__cast_attr int) x;
+	int *a = (int __cast_attr *) x;
+	int *a = (int *__cast_attr) x;
+	int *a = (int) x;
+}
diff --git a/tests/remove_cast_attr.cocci b/tests/remove_cast_attr.cocci
new file mode 100644
index 00000000..f171d44d
--- /dev/null
+++ b/tests/remove_cast_attr.cocci
@@ -0,0 +1,10 @@
+@r0@
+type T;
+attribute name __cast_attr;
+identifier x;
+@@
+
+  (
+	T
+-	__cast_attr
+  ) x
diff --git a/tests/remove_cast_attr.res b/tests/remove_cast_attr.res
new file mode 100644
index 00000000..fb5001b9
--- /dev/null
+++ b/tests/remove_cast_attr.res
@@ -0,0 +1,10 @@
+#define __cast_attr MACROANNOTATION
+
+int func()
+{
+	int *a = (int) x;
+	int *a = (int) x;
+	int *a = (int *) x;
+	int *a = (int *) x;
+	int *a = (int) x;
+}
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
