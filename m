Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7081C1E00F0
	for <lists+cocci@lfdr.de>; Sun, 24 May 2020 19:21:15 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04OHKflA019792;
	Sun, 24 May 2020 19:20:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C15357807;
	Sun, 24 May 2020 19:20:41 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8C3CF3D0F
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 19:20:39 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:644])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04OHKbMK013638
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 19:20:38 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id t16so6620157plo.7
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 10:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IWhjiqCz7sgfQyTp/d6pdTlEkZVv28HycuwtrcC3AHg=;
 b=GD+Aw4zQzV6sd1/pP+VrHlm+tddFn2e4Gl7Qnj/XPBFJ3UAqmoWi4hUuIpJTFNMhYc
 mB77ICRMA2U8fBRdyZq6/cXylteJGIKHxYtjBWgFYGH5Lpw2wyDNRjktJfJKyZKGGPr8
 Erjpqh0rq31kpaH9ykjEslrFoSouqd+9soQnF8+kI2SB/JB5twawgBXkS3hsbOE0FPAS
 xDzD0E33o7KqdlVzv31mlBDZ3h7ed3BrWuu7LTSJAULQK9OqMiTHtITq2X5xTq0ANAf3
 1+cb/EywJ8bJT8l3kRdIfk5JB5N/+uHtFiU47MzYxRNplx7i0KulRRij4zxB5/xItIpa
 +Sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IWhjiqCz7sgfQyTp/d6pdTlEkZVv28HycuwtrcC3AHg=;
 b=BcwoeOXnqd3NDwjTmuHF41Yai8VyvamD9C5zslyf+WgWIzExod0gwaAbf0stBnpUYm
 y0vHhduxTOO12mWgKElZksy/amN62jxSNpI/GSj5MIu/A+QYTuU0GN9H1+oTpw3AjXJG
 f3dRwjTD6vc0hSbJR4rzggJd7A0Eht7xd8VM6a/BoyCoLYz9ikMKuSSRX+loZGoGy7SL
 8uGRgHvZLVImCEO8AXYP8N/TPlfFY4MB1Qr4z/8yDu5T/VJKY81S6WilVdOeUSmKVQHu
 NuFxGi/EYj4U29vbAQ3F0woBM3y4YBU6vxY58oE1OyJ4gSW1E1xQys4p1IBBycyw57Mu
 IEjA==
X-Gm-Message-State: AOAM530L08nf6gaX5nNlmxZhC9qnzUSrntSypJRzdl5foQutYwfe3/A/
 GDG9EabyNSu6DV1A8wSloM5GCrDAw8Y=
X-Google-Smtp-Source: ABdhPJz+0al7k3pzOm/3mf9vPf9KQNhHzx/SU/Eqy3RWqhaJzzlpGvPWId4NMpoxMS7jysG4pe/biQ==
X-Received: by 2002:a17:902:9a46:: with SMTP id
 x6mr16624239plv.141.1590340837034; 
 Sun, 24 May 2020 10:20:37 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:20:36 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:12 +0530
Message-Id: <20200524171935.2504-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 24 May 2020 19:20:41 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 24 May 2020 19:20:39 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 07/30] parsing_cocci: type_infer: Reflect Macrodecl
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
type_infer.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/type_infer.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/type_infer.ml b/parsing_cocci/type_infer.ml
index e8aad810..34c4aa31 100644
--- a/parsing_cocci/type_infer.ml
+++ b/parsing_cocci/type_infer.ml
@@ -380,7 +380,7 @@ let rec propagate_types env =
     | Ast0.UnInit(_,ty,id,_,_) ->
 	List.map (function i -> (i,ty)) (strip id)
     | Ast0.FunProto(fi,nm,lp,params,va,rp,sem) -> []
-    | Ast0.MacroDecl(_,_,_,_,_,_) -> []
+    | Ast0.MacroDecl(_,_,_,_,_,_,_) -> []
     | Ast0.MacroDeclInit(_,_,_,_,_,_,exp,_) ->
         let _ = (propagate_types env).VT0.combiner_rec_initialiser exp in
 	[]
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
