Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0301E7CAD
	for <lists+cocci@lfdr.de>; Fri, 29 May 2020 14:09:56 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04TC9FpQ007126;
	Fri, 29 May 2020 14:09:15 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1F6417829;
	Fri, 29 May 2020 14:09:15 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id ABF835D47
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:09:12 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1043])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04TC9BiQ021457
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:09:11 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id t8so1260910pju.3
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 05:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u8KQVzS3ah3vs2qqwXtIf9FY1LkUh04IBlZi8QJebGs=;
 b=p5n3vDmd6kWPoFJ8EeIHIaaVjiqoqcGubzctsYJyFCE1y4ifeZcIpyOozCWtnDCWD5
 O5QLaUO2e4EpWbTdkx9MneW9JY37OjLcKgaZLul2yA/34A67Q6sPKPjbKDxqzU+XtT2j
 1pCArHyEjYg4VTUmIpcuV4oEs0pr33Hg0Ax0TWrg9KAkoPHT7AH85eN9aKi494Sya6+0
 +tpnynICAq75DHo2FuPsQ540K6HPUQyfmFVkjJs2zRjJAB5ViNpmNkItaWI6KeTJVOeI
 FBvHVUifQlX7a/L8kaoIzpZsGfxU9bvbB2EOiZttOdoCc2hz8Kca7a7GVAvDEgVP+l1b
 xDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u8KQVzS3ah3vs2qqwXtIf9FY1LkUh04IBlZi8QJebGs=;
 b=AlCbwKpOHTPXhtmX5MV6gpdqG9MEHokTB9PDX0ycE/TIdMfTS2Bm6AuHGuFiJ0oNAU
 KIYZ6oNrvmvvhsTBS/NnOysRLSyCyo4qb4Kd3kmjiqkUMBODJbzyI0aujz6CQQtM9qEE
 JHV/xkY6MNbhwDOW0k7DK8r2gedEtEJkmhxWvhiaT6mIP63okunVXLj3FlweUL98NKyN
 Hpj345sD5l1UtibJ7K8FJ9TGOvXRiQ+Uz2uQYPCmO0oB5dEeSaAD0ElqUQ/sPbmBFG0/
 nkFdPIO1nSpeAilMqJJXYHu4KzNgzTVw+q4GYayueArt0whEoe9HW7fOJnlm8R89+wlI
 u9nQ==
X-Gm-Message-State: AOAM5306oWfBhC2l2ndaCUhSc/c6BcYZSklAD1cMBaHt5SrXgZQh1bY8
 VSfn5iZsYOl/bGPSony81rnrdK6U
X-Google-Smtp-Source: ABdhPJzaHqCz4BBF0TkP3dQt2Pfsf/PTvmEsjRkh5qK1TdpEWuA8UzK8QhYNE1/VWbyrUhj6mhMLhQ==
X-Received: by 2002:a17:90a:3201:: with SMTP id
 k1mr8889683pjb.202.1590754150195; 
 Fri, 29 May 2020 05:09:10 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:09:09 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:43 +0530
Message-Id: <20200529120703.31145-14-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 29 May 2020 14:09:15 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 29 May 2020 14:09:12 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 13/32] parsing_cocci: single_statement: Reflect
	Cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
single_statement.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/single_statement.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/single_statement.ml b/parsing_cocci/single_statement.ml
index 4ad1c4e4..73554e9c 100644
--- a/parsing_cocci/single_statement.ml
+++ b/parsing_cocci/single_statement.ml
@@ -138,7 +138,7 @@ let rec left_expression e =
   | Ast0.ArrayAccess(exp1,lb,exp2,rb) -> left_expression exp1
   | Ast0.RecordAccess(exp,pt,field) -> left_expression exp
   | Ast0.RecordPtAccess(exp,ar,field) -> left_expression exp
-  | Ast0.Cast(lp,ty,rp,exp) -> modif_before_mcode lp
+  | Ast0.Cast(lp,ty,attr,rp,exp) -> modif_before_mcode lp
   | Ast0.SizeOfExpr(szf,exp) -> modif_before_mcode szf
   | Ast0.SizeOfType(szf,lp,ty,rp) -> modif_before_mcode szf
   | Ast0.TypeExp(ty) -> left_typeC ty
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
