Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 540081E7CCD
	for <lists+cocci@lfdr.de>; Fri, 29 May 2020 14:10:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04TCAAlR019039;
	Fri, 29 May 2020 14:10:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CD13D7829;
	Fri, 29 May 2020 14:10:10 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8B2915D47
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:10:08 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1044])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04TCA6rX016678
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 14:10:07 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id 5so1270884pjd.0
 for <cocci@systeme.lip6.fr>; Fri, 29 May 2020 05:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9xs+VxrE+SKT0t/5AoaC7h0As2M2DyZtXWTfrJjWgM=;
 b=s17Of79t13tqSZRbS2xGaRObBYmXSG9I9l5OalUJTYjRgjUmGowMqHSpBVtk5BtCGg
 JQ1RsLEV7I6BXXQDF+d/pg447svCG6YQcwxZh+Sf+DB8yKyWxAl4Vf0skmzerMms5JPj
 NcOskhzloqkb/g1tSa0NjakrKIHKqq/f5/04BIyRQjHL9U7T48LL8ffLiWcSz8sidSYc
 BT/puPvgB2l/0Ld7VL1CoGLBYMF/0l42hXhNG81YQIBnFwQZiFR2m7NH+6E5zZgDArPn
 v4cX5QO7orpCX8PslmQXP+gBzxW7k692kSo9MBlQTlh/bzszDRipjfNfWAiJ4QVA8ogY
 VxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9xs+VxrE+SKT0t/5AoaC7h0As2M2DyZtXWTfrJjWgM=;
 b=N81xP0HeLeJ4ELlwzJd5BoFVgprikI+/yERiH/Zbz5ji0ZFxbtmSIb5pdE0VXdBYc3
 toYTDFyrKnnrHXumRvFMuzZ63utIPshEzndxy2VUKWEYuxrdTys2mNttVLiPoRp1YIrq
 YiUAAwhNoFcSq0/2zOO2y8BTgaiiLYcfeetbChCgh6rj3df8+Kob12yNUDDb2Jgq/gzr
 iWqR8ToZZeVUxLJL0pWXmdrysgfcu0tc6r2Tt7CepN23qiO/H/yanj4Ds0Dye6eiZVfJ
 8O5jokJIR92z/DU1hLy3LiGTmpkLjJJNJl+LB+pXMMeYuYE5MiDe64c4EFv9W4iNEK7b
 zuWw==
X-Gm-Message-State: AOAM530X38g9TQElaPR/NY91jmxSDahh4zdXFodp2rwSoHysfzhX9JLA
 t7T9ZLGJWSyrN1fPIxTzOswdsbHA
X-Google-Smtp-Source: ABdhPJy0WyTRYBwRX2G0ek5jnXXbVsuYUpZmtLFo1b917nI5fzUgRwnq3MN3b6d2A3HLTTzAm4JZog==
X-Received: by 2002:a17:90a:3ad1:: with SMTP id
 b75mr9430928pjc.216.1590754206121; 
 Fri, 29 May 2020 05:10:06 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:694:e576:19d1:a79b:707d:59f2])
 by smtp.gmail.com with ESMTPSA id dw13sm7975161pjb.40.2020.05.29.05.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 05:10:05 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 29 May 2020 17:36:55 +0530
Message-Id: <20200529120703.31145-26-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
References: <20200529120703.31145-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 29 May 2020 14:10:10 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 29 May 2020 14:10:08 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v3 25/32] parsing_c: visitor_c: Visit Cast attributes
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

Cast attributes are added to the C AST. Visit these attributes in
the C AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/visitor_c.ml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/parsing_c/visitor_c.ml b/parsing_c/visitor_c.ml
index 57b5f32b..77a011d8 100644
--- a/parsing_c/visitor_c.ml
+++ b/parsing_c/visitor_c.ml
@@ -324,7 +324,10 @@ let rec vk_expr = fun bigf expr ->
 
     | SizeOfExpr  (e) -> exprf e
     | SizeOfType  (t) -> vk_type bigf t
-    | Cast    (t, e) -> vk_type bigf t; exprf e
+    | Cast    (t, a, e) ->
+        vk_type bigf t;
+        a +> List.iter (vk_attribute bigf);
+        exprf e
 
     (* old: | StatementExpr (((declxs, statxs), is)), is2 ->
      *          List.iter (vk_decl bigf) declxs;
@@ -1188,7 +1191,11 @@ let rec vk_expr_s = fun bigf expr ->
 
       | SizeOfExpr  (e) -> SizeOfExpr (exprf e)
       | SizeOfType  (t) -> SizeOfType (vk_type_s bigf t)
-      | Cast    (t, e)  -> Cast (vk_type_s bigf t, exprf e)
+      | Cast    (t, a, e)  ->
+          Cast
+            (vk_type_s bigf t,
+             a +> List.map (vk_attribute_s bigf),
+             exprf e)
 
       | StatementExpr (statxs, is) ->
           StatementExpr (
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
