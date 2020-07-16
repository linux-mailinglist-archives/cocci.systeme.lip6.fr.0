Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8659E22234F
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:02:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD24FV001878;
	Thu, 16 Jul 2020 15:02:04 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 044CC781E;
	Thu, 16 Jul 2020 15:02:04 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 746103F6C
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:02:02 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD21jR004259
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:02:01 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 47A232A2BDE
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:30:06 +0530
Message-Id: <20200716130016.23729-16-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716130016.23729-1-jaskaran.singh@collabora.com>
References: <20200716130016.23729-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:02:04 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:02:01 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 15/24] parsing_cocci: insert_plus: Reflect
	AttributeTag in SmPL AST0
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

AttributeTag is added to SmPL AST0. Reflect these changes in
insert_plus.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/ast0toast.mli  | 1 +
 parsing_cocci/insert_plus.ml | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/parsing_cocci/ast0toast.mli b/parsing_cocci/ast0toast.mli
index f4d2bb19..302c2b7d 100644
--- a/parsing_cocci/ast0toast.mli
+++ b/parsing_cocci/ast0toast.mli
@@ -36,6 +36,7 @@ val define_param_dots :
       Ast_cocci.define_param Ast_cocci.dots
 val case_line : Ast0_cocci.case_line -> Ast_cocci.case_line
 val string_fragment : Ast0_cocci.string_fragment -> Ast_cocci.string_fragment
+val attribute : Ast0_cocci.attr -> Ast_cocci.attr
 val typeC : bool (*allminus*) -> Ast0_cocci.typeC -> Ast_cocci.fullType
 val declaration : Ast0_cocci.declaration -> Ast_cocci.declaration
 val field : Ast0_cocci.field -> Ast_cocci.field
diff --git a/parsing_cocci/insert_plus.ml b/parsing_cocci/insert_plus.ml
index 63635b43..6c11a339 100644
--- a/parsing_cocci/insert_plus.ml
+++ b/parsing_cocci/insert_plus.ml
@@ -133,6 +133,7 @@ let create_root_token_table minus =
 	  | Ast0.ForInfoTag(d) -> Ast0.get_index d
 	  | Ast0.CaseLineTag(d) -> Ast0.get_index d
 	  | Ast0.StringFragmentTag(d) -> Ast0.get_index d
+	  | Ast0.AttributeTag(d) -> Ast0.get_index d
 	  | Ast0.TopTag(d) -> Ast0.get_index d
 	  | Ast0.IsoWhenTag(_) -> failwith "only within iso phase"
 	  | Ast0.IsoWhenTTag(_) -> failwith "only within iso phase"
@@ -461,6 +462,9 @@ let call_collect_minus context_nodes :
       | Ast0.StringFragmentTag(e) ->
 	  (Ast0.get_index e,
 	   (collect_minus_join_points e).VT0.combiner_rec_string_fragment e)
+      | Ast0.AttributeTag(e) ->
+          (Ast0.get_index e,
+           (collect_minus_join_points e).VT0.combiner_rec_attribute e)
       | Ast0.CaseLineTag(e) ->
 	  (Ast0.get_index e,
 	   (collect_minus_join_points e).VT0.combiner_rec_case_line e)
@@ -548,6 +552,7 @@ let mk_statement x        = Ast.StatementTag (Ast0toast.statement x)
 let mk_forinfo x          = Ast.ForInfoTag (Ast0toast.forinfo x)
 let mk_case_line x        = Ast.CaseLineTag (Ast0toast.case_line x)
 let mk_string_fragment x  = Ast.StringFragmentTag (Ast0toast.string_fragment x)
+let mk_attribute x        = Ast.AttributeTag (Ast0toast.attribute x)
 let mk_const_vol x        = Ast.ConstVolTag x
 let mk_token x info       = Ast.Token (x,Some info)
 let mk_meta (_,x) info    = Ast.Token (x,Some info)
@@ -751,6 +756,9 @@ let call_collect_plus context_nodes :
       | Ast0.StringFragmentTag(e) ->
 	  (Ast0.get_index e,
 	   (collect_plus_nodes e).VT0.combiner_rec_string_fragment e)
+      | Ast0.AttributeTag(e) ->
+          (Ast0.get_index e,
+           (collect_plus_nodes e).VT0.combiner_rec_attribute e)
       | Ast0.TopTag(e) ->
 	  (Ast0.get_index e,
 	   (collect_plus_nodes e).VT0.combiner_rec_top_level e)
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
