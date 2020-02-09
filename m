Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 271B3156B06
	for <lists+cocci@lfdr.de>; Sun,  9 Feb 2020 16:35:35 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 019FZFJh025928;
	Sun, 9 Feb 2020 16:35:15 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9797B7718;
	Sun,  9 Feb 2020 16:35:15 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 11EBE7718
 for <cocci@systeme.lip6.fr>; Sun,  9 Feb 2020 16:35:13 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:543])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 019FZBtC003629
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 9 Feb 2020 16:35:12 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id l24so2512684pgk.2
 for <cocci@systeme.lip6.fr>; Sun, 09 Feb 2020 07:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wJEO2wGMQKJV/ohpKPyAeBTsL/tteXWNt2JClbfnv8c=;
 b=k8V7I4kDs2EneTmD/2fFVHyS+EQi2hIinkVj3L+Ks1W/KB0pIBMGZpgXtisJsfOigd
 CvW2TZy7FA3VluMP6Hj8p77KIIiE+IjWSkJSCqhQw1oGOvsWcqNmQ0EgcuXggLMCc9zp
 TERhR9YNlIIr+ik52Ocr0d27V/N9XXC6KNmFDlJgMMsHjyRqYP1YhA6bMdDnIU4Xz7m4
 sZqzGOxf7Hjy6morkPmXnc/abuW53uVphYSg4PB/UtKXb4/+wEHuPGjuV72saw7B4eDo
 mbjPCcBuN6HetWjS3B8FE0cCLJZGULCQX3YLfHc4yxISbVgjDsdSxOC/3xcUxVYBULSu
 X/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wJEO2wGMQKJV/ohpKPyAeBTsL/tteXWNt2JClbfnv8c=;
 b=E/hXrSANegQBsDoD20p2Xys/I07nvRcU+p5rObZWbFGXFN1bxYALMziSMXZz1cHnN+
 SI2GKuhFH/lgVQC5Uqthrn3lcFM7bsvz88W1seMAoovv8u7H+O4XRb4FPpa4tWr74NFu
 DV7zsOHXVwfsGWcxi/YwrZF2yJvhNSNCy3rVS2RK8n+qvj0tZztzcWc8WsyzD2ZYj1wc
 FIOUlUbUwEj5gyzMjwVZUWuGmckM4D86+UigguHQg2ALysK1SKM3Hilq0Zs0DHkF6+ZY
 z3ec9O0e7hA9hkr4fDR3UWsznsU5DZiOaj0DbfCIDOQo1AuQuAWvIFAt/W5d+ku5TBtL
 DdSA==
X-Gm-Message-State: APjAAAVk3PErrUn+lnCZ29U32PLRbDXm7SPYf7rGC5vLA6j8IsgBhxbr
 6RQuf/hOr99XZPEmyw9dqDalNNaN
X-Google-Smtp-Source: APXvYqw8yCg6wVwBM2m81xmUuy2nfZCMu+0ART74xY0kB8P1d24f8vBX8/H5p/5JWp8n0ZJaBPZ/MA==
X-Received: by 2002:a63:3084:: with SMTP id w126mr9540094pgw.169.1581262510673; 
 Sun, 09 Feb 2020 07:35:10 -0800 (PST)
Received: from localhost.localdomain ([2405:204:22ac:7250:d1c8:6411:2f12:731d])
 by smtp.gmail.com with ESMTPSA id c11sm9451702pfo.170.2020.02.09.07.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 07:35:10 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  9 Feb 2020 21:04:51 +0530
Message-Id: <20200209153452.11837-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200209153452.11837-1-jaskaransingh7654321@gmail.com>
References: <20200209153452.11837-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 09 Feb 2020 16:35:15 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 09 Feb 2020 16:35:12 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v4 2/3] tests: Add space between * and const in
	ptrconstptr.res
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

A space is now added between the * and qualifier. Reflect this
change in the ptrconstptr test case.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/ptrconstptr.res | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/ptrconstptr.res b/tests/ptrconstptr.res
index f5b2210c..1d0c3c1d 100644
--- a/tests/ptrconstptr.res
+++ b/tests/ptrconstptr.res
@@ -1,3 +1,3 @@
 void main() {
-	const char *const *y;
+	const char * const *y;
 }
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
