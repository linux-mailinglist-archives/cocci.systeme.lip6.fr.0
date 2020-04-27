Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDAE1BA349
	for <lists+cocci@lfdr.de>; Mon, 27 Apr 2020 14:10:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03RC9sut003776;
	Mon, 27 Apr 2020 14:09:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4F1627839;
	Mon, 27 Apr 2020 14:09:54 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EF0047769
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 14:09:51 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1041])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03RC9oTa012247
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 14:09:51 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id a32so7440657pje.5
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 05:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IxQ5yleQGOYivsLqM0BuUraugLRpcVwNM1GXoeWyL5U=;
 b=qilYU/Dkw12TQZlxoUFznMw9AZDcCHfHfsWIrQOiDrRSuiq8hQN/ZQL+zPYpPRajAc
 1Diwc3iqROFJBaN3u+60/kcRjhTxRogjd/63hCCtvMlzYkvkI0I/UwolABbkq2Hr0ydM
 RqOjg1mdPgt/nAnhsaLGDhgUsvC5LdvAzOug/ocDbvf2CzrBRjFFVjaU4CA4qY75Zgnp
 N9w4lbEfNk9d+gBKqqDupoGc07wFFfHIi3dkXTDXXVM/v5onbXArks493oMXeyjB2jYG
 c3D0BUu0W8lQBF8UhakGsdyki1z+nExsZYSyP2VYRwwyxk0tlXxNvcaL45I7V39TUYb/
 GJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IxQ5yleQGOYivsLqM0BuUraugLRpcVwNM1GXoeWyL5U=;
 b=CHjxiMV8kcdCxicg9b+Slali+SPjbilIKgtJPHLneazgFcnw8y/O7+fIvFlg6Kn1OM
 oHZ6SVqZbqsZAa2R8Fy0+vF+gyZY0HohzM/Np7dIbXXrd/G/3HH7XPEdNn+BDfJGvwto
 5F1SmxLtWV6dRKCx5bayF4VFlbojADJR1Yy95VYCyhF/PlNjPD7gaYA9zAXf64L0UNvD
 WFM59/00G6prksbmF/U1cqJbNug5mfwAAsjUHh+rolhH8dcxQId4xYV++rF1q9B50oaF
 fKqVLZqnjlyNybikeZaww0kkuTXVXtl7SBNHeLeOl4OFtrEssk4OblsjHttvMLaJXPqW
 TfRg==
X-Gm-Message-State: AGi0Pub7xz/V124RKMV8H0qsaiyZaMX/uy9xquh/S78Aj3st5wWA5GhJ
 kt+0SXJnTaPYHY58NR6TelycXMN2+qQ=
X-Google-Smtp-Source: APiQypLb3W7WuPxWyKvEaTMtBT9ebuXNb3xvimxfUAzf3PqgLnuNBJ764u/+/XDTWifJWy6uSFBFFQ==
X-Received: by 2002:a17:902:b58a:: with SMTP id
 a10mr23398184pls.129.1587989389300; 
 Mon, 27 Apr 2020 05:09:49 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:47 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:26 +0530
Message-Id: <20200427120834.380-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 14:09:54 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Mon, 27 Apr 2020 14:09:51 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 15/23] parsing_cocci: visitor_ast: Visit Parameter
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

Parameter attributes are added to the SmPL AST. Visit these attributes in
the AST visitor.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/visitor_ast.ml | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/parsing_cocci/visitor_ast.ml b/parsing_cocci/visitor_ast.ml
index 8e530114..f1e78d8c 100644
--- a/parsing_cocci/visitor_ast.ml
+++ b/parsing_cocci/visitor_ast.ml
@@ -621,9 +621,18 @@ let combiner bind option_default
   and parameterTypeDef p =
     let k p =
       match Ast.unwrap p with
-	Ast.VoidParam(ty) -> fullType ty
-      | Ast.Param(ty,Some id) -> named_type ty id
-      | Ast.Param(ty,None) -> fullType ty
+	Ast.VoidParam(ty,attr) ->
+          let lty = fullType ty in
+	  let lattr = multibind (List.map string_mcode attr) in
+          bind lty lattr
+      | Ast.Param(ty,Some id,attr) ->
+          let lid = named_type ty id in
+	  let lattr = multibind (List.map string_mcode attr) in
+          bind lid lattr
+      | Ast.Param(ty,None,attr) ->
+          let lty = fullType ty in
+	  let lattr = multibind (List.map string_mcode attr) in
+          bind lty lattr
       | Ast.MetaParam(name,_,_,_) -> meta_mcode name
       | Ast.MetaParamList(name,_,_,_,_) -> meta_mcode name
       |	Ast.AsParam(p,asexp) ->
@@ -1582,8 +1591,11 @@ let rebuilder
     let k p =
       Ast.rewrap p
 	(match Ast.unwrap p with
-	  Ast.VoidParam(ty) -> Ast.VoidParam(fullType ty)
-	| Ast.Param(ty,id) -> Ast.Param(fullType ty, get_option ident id)
+	  Ast.VoidParam(ty,attr) ->
+            Ast.VoidParam(fullType ty,List.map string_mcode attr)
+	| Ast.Param(ty,id,attr) ->
+            Ast.Param
+              (fullType ty, get_option ident id,List.map string_mcode attr)
 	| Ast.MetaParam(name,constraints,keep,inherited) ->
 	    Ast.MetaParam(meta_mcode name,constraints,keep,inherited)
 	| Ast.MetaParamList(name,lenname_inh,constraints,keep,inherited) ->
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
