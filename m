Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0979D1BC625
	for <lists+cocci@lfdr.de>; Tue, 28 Apr 2020 19:06:08 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03SH5t1L008170;
	Tue, 28 Apr 2020 19:05:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B1E97782D;
	Tue, 28 Apr 2020 19:05:55 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E997E3DC8
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:05:53 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:542])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03SH5qcl007725
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 19:05:53 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id h69so10642702pgc.8
 for <cocci@systeme.lip6.fr>; Tue, 28 Apr 2020 10:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2PLzjijGSWHhGZmQAc+EDg38Sv7Vw78F5dVtWsvodwU=;
 b=EW64WVeZJMt2mA46M430+xTsfD+roFU3rzgWDqRAX4L5pSsUfLh6jsU88pbLe2Ngax
 JGsBOu5m1cjoPmPU722SQhGRw3pzMHI9Nf9QMAPSOsF3PvTSnthAPiqcg4UWVLj8Fu3a
 LKe+F1FudjmmNlOGVUSOtBYKFybddXjPZ4YjgIHnSHyqrU2hXUWuMWAoNeSA8v21NEBN
 yedCnR225mNPAj43olNFzt6pSmVVYNYNgTOoXK+NafGlgHokk1k8wEbUzLzDOVwYMfPu
 F4Zy0lUvg0x5rvUGIuSUYGaLuS0DwRrJQr73UgxQfbULZQvCVEGjnC6X1+ZYbmay/fkN
 Ae5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2PLzjijGSWHhGZmQAc+EDg38Sv7Vw78F5dVtWsvodwU=;
 b=NnGi/1OwuqEZbAubJqbX+SmcsLSitj/3tz0gwn9C2x/OBpmBBYw06hkldZ9x7WPaTj
 03u5tf6Sbyp1hP6MDOJ2yudXxTfv49ITNpMkgJjG/Nwraqs8b9mGGX94O9i/9Wwkkugn
 AG4uinT7Zpg1xjf12dshDdEwkkB05Brtn2XDxweMKx4FLyqFwfKm95kb63azSdIitCwj
 BwHb04tB4tG1FWBPWJwXwaYol5QBVqFmruiJnzMH442f/QnSnJwVKoGiLUwyCiLgm8t1
 NNH/4KvbY+USKuTZ+utVAfxF3d97QcEkVX3DcbcfWRf6PPIQn/YLyM5ujd/tH+FiL/DI
 tFhQ==
X-Gm-Message-State: AGi0PuYxQzpPaDv18+IPSJtA7bagqixfLWjl2HBIMmKjizlbefR+5VBp
 5uVIe2vbBBbs+75Kkf13FH7Yflb14uM=
X-Google-Smtp-Source: APiQypIlMaoWRKHrCDXU4FhiTmXQZaSzw53O0LhSGyvSkKdMTJ5Ydlq2mvxsiUbfPR7DiPYLgzG2SQ==
X-Received: by 2002:a63:4846:: with SMTP id x6mr1656768pgk.209.1588093551545; 
 Tue, 28 Apr 2020 10:05:51 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:05:51 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:24 +0530
Message-Id: <20200428170228.7002-29-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 28 Apr 2020 19:05:55 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 28 Apr 2020 19:05:53 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 28/32] ocaml: coccilib: Reflect Cast attributes
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

Cast attributes are added to the C and SmPL ASTs. Reflect these changes
in coccilib.mli.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 ocaml/coccilib.mli | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index a305d616..0c379547 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -146,7 +146,7 @@ module Ast_c :
       | RecordPtAccess of expression * name
       | SizeOfExpr of expression
       | SizeOfType of fullType
-      | Cast of fullType * expression
+      | Cast of fullType * expression * attribute list
       | StatementExpr of compound wrap
       | Constructor of fullType * initialiser
       | ParenExpr of expression
@@ -2569,7 +2569,7 @@ module Ast_cocci :
       | ArrayAccess of expression * string mcode * expression * string mcode
       | RecordAccess of expression * string mcode * ident
       | RecordPtAccess of expression * string mcode * ident
-      | Cast of string mcode * fullType * string mcode * expression
+      | Cast of string mcode * fullType * attr list * string mcode * expression
       | SizeOfExpr of string mcode * expression
       | SizeOfType of string mcode * string mcode * fullType * string mcode
       | TypeExp of fullType
@@ -3305,7 +3305,7 @@ module Ast0_cocci :
       | ArrayAccess of expression * string mcode * expression * string mcode
       | RecordAccess of expression * string mcode * ident
       | RecordPtAccess of expression * string mcode * ident
-      | Cast of string mcode * typeC * string mcode * expression
+      | Cast of string mcode * typeC * attr list * string mcode * expression
       | SizeOfExpr of string mcode * expression
       | SizeOfType of string mcode * string mcode * typeC * string mcode
       | TypeExp of typeC
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
