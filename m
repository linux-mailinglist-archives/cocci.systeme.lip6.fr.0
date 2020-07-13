Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF64218859
	for <lists+cocci@lfdr.de>; Wed,  8 Jul 2020 15:02:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 068D1Wvx008642;
	Wed, 8 Jul 2020 15:01:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0F141781D;
	Wed,  8 Jul 2020 15:01:33 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 648A67489
 for <cocci@systeme.lip6.fr>; Wed,  8 Jul 2020 15:01:30 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 068D1TKp020286
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 8 Jul 2020 15:01:29 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 63E122A5788
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Wed,  8 Jul 2020 18:30:31 +0530
Message-Id: <20200708130035.26687-17-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200708130035.26687-1-jaskaran.singh@collabora.com>
References: <20200708130035.26687-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 15:01:33 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 15:01:29 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH v2 RESEND 16/20] parsing_cocci: unify_ast: Wrap SmPL
	Attributes
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

Attributes are wrapped in the SmPL AST. Reflect these changes in
unify_ast.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/unify_ast.ml | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/parsing_cocci/unify_ast.ml b/parsing_cocci/unify_ast.ml
index 788c8fdc..90cb70ee 100644
--- a/parsing_cocci/unify_ast.ml
+++ b/parsing_cocci/unify_ast.ml
@@ -221,7 +221,7 @@ and unify_expression e1 e2 =
   | (Ast.RecordPtAccess(e1,pt1,fld1),Ast.RecordPtAccess(e2,pt2,fld2)) ->
       unify_expression e1 e2 && unify_ident fld1 fld2
   | (Ast.Cast(lp1,ty1,attr1,rp1,e1),Ast.Cast(lp2,ty2,attr2,rp2,e2)) ->
-      if List.for_all2 unify_mcode attr1 attr2
+      if List.for_all2 unify_attribute attr1 attr2
       then unify_fullType ty1 ty2 && unify_expression e1 e2
       else false
   | (Ast.SizeOfExpr(szf1,e1),Ast.SizeOfExpr(szf2,e2)) ->
@@ -386,7 +386,7 @@ and unify_declaration d1 d2 =
   | (Ast.Init(stg1,ft1,id1,attr1,eq1,i1,s1),
      Ast.Init(stg2,ft2,id2,attr2,eq2,i2,s2)) ->
       if bool_unify_option unify_mcode stg1 stg2 &&
-         List.for_all2 unify_mcode attr1 attr2
+         List.for_all2 unify_attribute attr1 attr2
       then
 	unify_fullType ft1 ft2 &&
 	unify_ident id1 id2 &&
@@ -394,7 +394,7 @@ and unify_declaration d1 d2 =
       else false
   | (Ast.UnInit(stg1,ft1,id1,attr1,s1),Ast.UnInit(stg2,ft2,id2,attr2,s2)) ->
       if bool_unify_option unify_mcode stg1 stg2 &&
-         List.for_all2 unify_mcode attr1 attr2
+         List.for_all2 unify_attribute attr1 attr2
       then unify_fullType ft1 ft2 && unify_ident id1 id2
       else false
   | (Ast.FunProto(fi1,nm1,lp1,params1,va1,rp1,sem1),
@@ -414,7 +414,7 @@ and unify_declaration d1 d2 =
   | (Ast.MacroDecl(s1,n1,lp1,args1,rp1,attr1,sem1),
      Ast.MacroDecl(s2,n2,lp2,args2,rp2,attr2,sem2)) ->
        if bool_unify_option unify_mcode s1 s2 &&
-         List.for_all2 unify_mcode attr1 attr2
+         List.for_all2 unify_attribute attr1 attr2
        then
 	 unify_ident n1 n2 &&
 	 unify_dots unify_expression edots args1 args2
@@ -428,7 +428,7 @@ and unify_declaration d1 d2 =
 	 unify_initialiser ini1 ini2
        else false
   | (Ast.TyDecl(ft1,attr1,s1),Ast.TyDecl(ft2,attr2,s2)) ->
-      if List.for_all2 unify_mcode attr1 attr2
+      if List.for_all2 unify_attribute attr1 attr2
       then unify_fullType ft1 ft2
       else false
   | (Ast.Typedef(stg1,ft1,id1,s1),Ast.Typedef(stg2,ft2,id2,s2)) ->
@@ -549,12 +549,12 @@ and unify_designator d1 d2 =
 and unify_parameterTypeDef p1 p2 =
   match (Ast.unwrap p1,Ast.unwrap p2) with
     (Ast.VoidParam(ft1,attr1),Ast.VoidParam(ft2,attr2)) ->
-      if List.for_all2 unify_mcode attr1 attr2
+      if List.for_all2 unify_attribute attr1 attr2
       then unify_fullType ft1 ft2
       else false
   | (Ast.Param(ft1,i1,attr1),Ast.Param(ft2,i2,attr2)) ->
 
-      if List.for_all2 unify_mcode attr1 attr2
+      if List.for_all2 unify_attribute attr1 attr2
       then
         unify_fullType ft1 ft2 &&
         unify_option unify_ident i1 i2
@@ -704,7 +704,7 @@ and unify_fninfo patterninfo cinfo =
     | (Ast.FInline(ia)::resta,Ast.FInline(ib)::restb) ->
 	if unify_mcode ia ib then loop (resta,restb) else false
     | (Ast.FAttr(ia)::resta,Ast.FAttr(ib)::restb) ->
-	if unify_mcode ia ib then loop (resta,restb) else false
+	if unify_attribute ia ib then loop (resta,restb) else false
     | (x::resta,((y::_) as restb)) ->
 	(match compare x y with
 	  -1 -> false
@@ -713,6 +713,11 @@ and unify_fninfo patterninfo cinfo =
     | _ -> false in
   loop (patterninfo,cinfo)
 
+and unify_attribute attr1 attr2 =
+  match (Ast.unwrap attr1,Ast.unwrap attr2) with
+    (Ast.Attribute(attr1),Ast.Attribute(attr2)) ->
+      unify_mcode attr1 attr2
+
 and unify_exec_code ec1 ec2 =
   match (Ast.unwrap ec1,Ast.unwrap ec2) with
     (Ast.ExecEval(colon1,id1),Ast.ExecEval(colon2,id2)) ->
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
