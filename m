Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2492D1E987F
	for <lists+cocci@lfdr.de>; Sun, 31 May 2020 17:28:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04VFReI2011680;
	Sun, 31 May 2020 17:27:40 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9CA18781F;
	Sun, 31 May 2020 17:27:40 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EE6803C89
 for <cocci@systeme.lip6.fr>; Sun, 31 May 2020 17:27:37 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:444])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04VFRa5Q008534
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 31 May 2020 17:27:37 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id v2so2264315pfv.7
 for <cocci@systeme.lip6.fr>; Sun, 31 May 2020 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5KaC2XBql1jkacWCMm+Iba/ysMxpoPIQRvYs5v86B6E=;
 b=DXd9k+duR+ULG5yVLMr0NodpfRqW33Fm0DRZ6cNpkgr0ycf8cpT0eFotGVWerqmZPz
 EGPktpLeIlpAK3fvBx9Z+MuALp7KxntpcvMpgxE7AJNUI9q+rzB+AKCqMAwLf3s9rQo6
 Xs+3ZyIqZC10Bq7pIPaHf9Tg3btOUObhuwe9OjFCXkV0yXjA4c86KM5iKg0vSBvzyiyC
 3fTfZ3PUZ5ZNErGMNyCaJTlmQ6eWcYK6wTL1g6YhO1jGmXm6nQ+EDyUw/rmXiN+WDf4c
 YhXdJKYj8Ry6m+f1HM5xVlX2zOGs35M3jDUdioeXoMe5zvcGuGAiQgK8WPaMHpgcQj3O
 E51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5KaC2XBql1jkacWCMm+Iba/ysMxpoPIQRvYs5v86B6E=;
 b=OZw/Q0D20T0oC3WJMUfgOmpLJYBdtz33Eqkik2mhdFp0RZe/R8/hz+8k9kl71paut4
 auYTJ1x8W8d85RKDeJD6ZN56lwMI09I+grpfdUUKDkDrcpCg2ecfLoz0L+ifyZCexFY+
 N1Obl+78SquCvgtyv0RFD3yefypyBvjOxPeunhpT/ERjP67IZo5kbawPbxnD9NQj+kw8
 veFCHyGoKJf0zd2YeFIo6XTUQxfW68zBcfqyVIiDxqN7C2qgu3B7cx8XQgOftUttwGHM
 NNZQo1IARt02Se5jPwAe9KxE53DRgeI6OckiFJTs97HIE0oD01Cmgy1oJ/DahyZ8XNwk
 SFCw==
X-Gm-Message-State: AOAM5306k1YecmXdShI8LTI9zg0x8guxMPNfQPIfI5viD/+jEjT1kAQf
 Ps8x/twKEMgJ9nqjN1v4Q/renw7c
X-Google-Smtp-Source: ABdhPJyCFnE65dUpbCrKfZhCxvP0gMkIo9GTwH41MVZW8mHgmoxZ2w/Axb2pFYDCtKWDcOtzinqW+g==
X-Received: by 2002:a65:4488:: with SMTP id l8mr15797886pgq.327.1590938855645; 
 Sun, 31 May 2020 08:27:35 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:35 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:04 +0530
Message-Id: <20200531152621.2886-11-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 31 May 2020 17:27:40 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 31 May 2020 17:27:37 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 10/27] parsing_cocci: compute_lines: Reflect struct
	end attributes
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

Struct end attributes are added to the SmPL AST. Reflect these changes
in compute_lines.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/compute_lines.ml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/compute_lines.ml b/parsing_cocci/compute_lines.ml
index 682e41a4..4f273307 100644
--- a/parsing_cocci/compute_lines.ml
+++ b/parsing_cocci/compute_lines.ml
@@ -747,10 +747,11 @@ and declaration d =
 	  let stg = Some (normal_mcode x) in
 	  mkres d (Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem))
 	    (promote_mcode x) (promote_mcode sem))
-  | Ast0.TyDecl(ty,sem) ->
+  | Ast0.TyDecl(ty,attr,sem) ->
       let ty = typeC ty in
+      let attr = List.map normal_mcode attr in
       let sem = normal_mcode sem in
-      mkres d (Ast0.TyDecl(ty,sem)) ty (promote_mcode sem)
+      mkres d (Ast0.TyDecl(ty,attr,sem)) ty (promote_mcode sem)
   | Ast0.Typedef(stg,ty,id,sem) ->
       let stg = normal_mcode stg in
       let ty = typeC ty in
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
