Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5507C1BC615
	for <lists+cocci@lfdr.de>; Tue, 28 Apr 2020 19:04:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03SH4LhP014159;
	Tue, 28 Apr 2020 19:04:21 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 348893DC8;
	Tue, 28 Apr 2020 19:04:21 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8A8213DC8
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:04:18 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:644])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03SH4G4J008716
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:04:17 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id z6so8617253plk.10
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 10:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4tue06gQmHfFX9AI66O32ZUH/JCMTyGAYTbjMe2OGSw=;
 b=fzFJgw9oW9k7Ah+jojaKm5kxzBfh6nodICFDQ+fW/6jcfZ6ND1JP8h6hpSjIB4wbpC
 AS70FREGzrTNoz3VfApO4vkXmAteaa6QLK5d/4pm+RkIXWU1yXr0cyYoV1IFLeCyJ93F
 TxiHh2XD0rkzQDwuqqa1zew+5Lfmg0PCEIvR4+FGQN/OPS/XyJoteXBlavabwSjwQpWX
 PujqZ4KD1RnRWHU8k5licdg227/XpYZ/dGwU2QRCqdPIO+p5rXsepTHcX0eHLToWMdPu
 5oXNvTUGEsGYaTnpZii7w0PMCZyFHmjHQYcC+VDei/nlRw/i7aCetDNrIHSyTdKipw8d
 /NHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4tue06gQmHfFX9AI66O32ZUH/JCMTyGAYTbjMe2OGSw=;
 b=uVf41r7R0TfvNmZ41uBjB43aUJ9xhaAu+9n7c9Uc8T3C0122xr3kTbNCLbDXmKd//H
 m3KkTfCFycx++OupSbX0m7mz3uYsxFaYv3/HtFiipBcYntUfVzZl35Y7BkIKrwCz8RzP
 48XIEvdgfzs92UXrk2u/cuei10UN1TQthXWQQvs3YuPXISiltDDfBF22cZqW8n+nxTaA
 +PiuWuEIp2fd2lV8eOPAOKs+BORHJE2iIxrWQ2tpd37xww5XpCRRfkU0LoPY1m3IkbpA
 AuREX9Tozv4N6IeUAr+RbTEcVUcF/WjQJfVCHbgBfxLSPuo49af+ZEC8scwFPmz1ISoS
 0nCw==
X-Gm-Message-State: AGi0PuYez9B5OzIHbwIC4+yNMrFJ0IIPw7P44zpnZJ3wYhs+kqAmu+l0
 zcBjRP4UFyDik67B/DW7qVKFkM8l9Ng=
X-Google-Smtp-Source: APiQypLGSlggN5yXluqTABwmvQpcUEEOqDrHcvFWpVMmTm8yozpNImc1s0rr4QcrRkS1mZ9h+9yEYQ==
X-Received: by 2002:a17:90a:fb89:: with SMTP id
 cp9mr6164217pjb.40.1588093456221; 
 Tue, 28 Apr 2020 10:04:16 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:04:15 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:16 +0530
Message-Id: <20200428170228.7002-21-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:04:21 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 28 Apr 2020 19:04:18 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 20/32] parsing_c: ast_c: Add Cast attributes
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

Add cast attributes to the C AST. This is a list of attributes in the
Cast type of the C AST.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/ast_c.ml  | 2 +-
 parsing_c/ast_c.mli | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/parsing_c/ast_c.ml b/parsing_c/ast_c.ml
index f25f9b55..6a828943 100644
--- a/parsing_c/ast_c.ml
+++ b/parsing_c/ast_c.ml
@@ -343,7 +343,7 @@ and expression = (expressionbis * exp_info ref (* semantic: *)) wrap3
 
   | SizeOfExpr     of expression
   | SizeOfType     of fullType
-  | Cast           of fullType * expression
+  | Cast           of fullType * expression * attribute list
 
   (* gccext: *)
   | StatementExpr of compound wrap (* ( )     new scope *)
diff --git a/parsing_c/ast_c.mli b/parsing_c/ast_c.mli
index 8923a335..8a9a6f66 100644
--- a/parsing_c/ast_c.mli
+++ b/parsing_c/ast_c.mli
@@ -104,7 +104,7 @@ and expressionbis =
   | RecordPtAccess of expression * name
   | SizeOfExpr of expression
   | SizeOfType of fullType
-  | Cast of fullType * expression
+  | Cast of fullType * expression * attribute list
   | StatementExpr of compound wrap
   | Constructor of fullType * initialiser
   | ParenExpr of expression
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
