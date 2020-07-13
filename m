Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B8821884D
	for <lists+cocci@lfdr.de>; Wed,  8 Jul 2020 15:01:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 068D1KqQ005666;
	Wed, 8 Jul 2020 15:01:20 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 21A6F7849;
	Wed,  8 Jul 2020 15:01:16 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D0DAD7831
 for <cocci@systeme.lip6.fr>; Wed,  8 Jul 2020 15:01:12 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 068D1CrX010159
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 8 Jul 2020 15:01:12 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 0A7682A0A8B
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Wed,  8 Jul 2020 18:30:18 +0530
Message-Id: <20200708130035.26687-4-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200708130035.26687-1-jaskaran.singh@collabora.com>
References: <20200708130035.26687-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 15:01:20 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 08 Jul 2020 15:01:12 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH v2 RESEND 03/20] parsing_cocci: visitor_ast0: Wrap
	SmPL Attributes
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

Attributes are wrapped in the SmPL AST. Create a function for attributes
in the SmPL AST0 visitor. This function has not been added to the
visitor API yet.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/visitor_ast0.ml | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/parsing_cocci/visitor_ast0.ml b/parsing_cocci/visitor_ast0.ml
index 87b2b3f5..a5902f8c 100644
--- a/parsing_cocci/visitor_ast0.ml
+++ b/parsing_cocci/visitor_ast0.ml
@@ -187,7 +187,7 @@ let visitor mode bind option_default
 	| Ast0.Cast(lp,ty,attr,rp,exp) ->
 	    let (lp_n,lp) = string_mcode lp in
 	    let (ty_n,ty) = typeC ty in
-	    let (attr_n,attr) = map_split_bind string_mcode attr in
+	    let (attr_n,attr) = map_split_bind attribute attr in
 	    let (rp_n,rp) = string_mcode rp in
 	    let (exp_n,exp) = expression exp in
             (multibind [lp_n;ty_n;attr_n;rp_n;exp_n],
@@ -611,7 +611,7 @@ let visitor mode bind option_default
 	| Ast0.Init(stg,ty,id,attr,eq,ini,sem) ->
 	    let (stg_n,stg) = get_option storage_mcode stg in
 	    let ((ty_id_n,ty),id) = named_type ty id in
-	    let (attr_n,attr) = map_split_bind string_mcode attr in
+	    let (attr_n,attr) = map_split_bind attribute attr in
 	    let (eq_n,eq) = string_mcode eq in
 	    let (ini_n,ini) = initialiser ini in
 	    let (sem_n,sem) = string_mcode sem in
@@ -620,7 +620,7 @@ let visitor mode bind option_default
 	| Ast0.UnInit(stg,ty,id,attr,sem) ->
 	    let (stg_n,stg) = get_option storage_mcode stg in
 	    let ((ty_id_n,ty),id) = named_type ty id in
-	    let (attr_n,attr) = map_split_bind string_mcode attr in
+	    let (attr_n,attr) = map_split_bind attribute attr in
 	    let (sem_n,sem) = string_mcode sem in
 	    (multibind [stg_n;ty_id_n;attr_n;sem_n],
 	     Ast0.UnInit(stg,ty,id,attr,sem))
@@ -645,7 +645,7 @@ let visitor mode bind option_default
 	    let (lp_n,lp) = string_mcode lp in
 	    let (args_n,args) = expression_dots args in
 	    let (rp_n,rp) = string_mcode rp in
-	    let (attr_n,attr) = map_split_bind string_mcode attr in
+	    let (attr_n,attr) = map_split_bind attribute attr in
 	    let (sem_n,sem) = string_mcode sem in
 	    (multibind [stg_n;name_n;lp_n;args_n;rp_n;attr_n;sem_n],
 	     Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem))
@@ -662,7 +662,7 @@ let visitor mode bind option_default
 	     Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem))
 	| Ast0.TyDecl(ty,attr,sem) ->
 	    let (ty_n,ty) = typeC ty in
-	    let (attr_n,attr) = map_split_bind string_mcode attr in
+	    let (attr_n,attr) = map_split_bind attribute attr in
 	    let (sem_n,sem) = string_mcode sem in
             (multibind [ty_n; attr_n; sem_n], Ast0.TyDecl(ty,attr,sem))
 	| Ast0.Typedef(stg,ty,id,sem) ->
@@ -832,15 +832,15 @@ let visitor mode bind option_default
 	(match Ast0.unwrap p with
 	  Ast0.VoidParam(ty, attrs) ->
 	    let (ty_n,ty) = typeC ty in
-	    let (attr_n,attr) = map_split_bind string_mcode attrs in
+	    let (attr_n,attr) = map_split_bind attribute attrs in
             (bind ty_n attr_n,Ast0.VoidParam(ty, attrs))
 	| Ast0.Param(ty,Some id,attrs) ->
 	    let ((ty_id_n,ty),id) = named_type ty id in
-	    let (attr_n,attr) = map_split_bind string_mcode attrs in
+	    let (attr_n,attr) = map_split_bind attribute attrs in
 	    (bind ty_id_n attr_n, Ast0.Param(ty,Some id,attr))
 	| Ast0.Param(ty,None,attrs) ->
 	    let (ty_n,ty) = typeC ty in
-	    let (attr_n,attr) = map_split_bind string_mcode attrs in
+	    let (attr_n,attr) = map_split_bind attribute attrs in
 	    (bind ty_n attr_n, Ast0.Param(ty,None,attr))
 	| Ast0.MetaParam(name,constraints,pure) ->
 	    let (n,name) = meta_mcode name in
@@ -1146,7 +1146,16 @@ let visitor mode bind option_default
     | Ast0.FInline(inline) ->
 	let (n,inline) = string_mcode inline in (n,Ast0.FInline(inline))
     | Ast0.FAttr(init) ->
-	let (n,init) = string_mcode init in (n,Ast0.FAttr(init))
+	let (n,init) = attribute init in (n,Ast0.FAttr(init))
+
+  and attribute a =
+    let k a =
+      rewrap a
+        (match Ast0.unwrap a with
+          Ast0.Attribute(attr) ->
+            let (attr_n,attr) = string_mcode attr in
+            (attr_n,Ast0.Attribute(attr))) in
+    k a
 
   (* we only include the when string mcode w because the parameterised
      string_mcodefn function might have side-effects *)
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
