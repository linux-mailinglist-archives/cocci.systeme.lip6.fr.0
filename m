Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 006F822DF3A
	for <lists+cocci@lfdr.de>; Sun, 26 Jul 2020 14:53:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06QCqR0M025046;
	Sun, 26 Jul 2020 14:52:29 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 374EA777B;
	Sun, 26 Jul 2020 14:52:29 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 10A503F6C
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:52:26 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06QCqMK7008069
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:52:22 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 3F27027088D
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Sun, 26 Jul 2020 18:21:07 +0530
Message-Id: <20200726125141.17787-10-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200726125141.17787-1-jaskaran.singh@collabora.com>
References: <20200726125141.17787-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:52:29 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:52:22 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 09/43] ocaml: yes_prepare_ocamlcocci: Reflect
	MetaAttribute & MetaAttributeDecl
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

MetaAttribute and MetaAttributeDecl are added to the SmPL AST. Reflect
these changes in yes_prepare_ocamlcocci.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 ocaml/yes_prepare_ocamlcocci.ml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ocaml/yes_prepare_ocamlcocci.ml b/ocaml/yes_prepare_ocamlcocci.ml
index aa6a1b606..fef237189 100644
--- a/ocaml/yes_prepare_ocamlcocci.ml
+++ b/ocaml/yes_prepare_ocamlcocci.ml
@@ -114,6 +114,7 @@ let ast_rep_binding ctr = function
   | (Some nm,Ast.MetaStmDecl _) -> print_match ctr nm "Stmt"
   | (Some nm,Ast.MetaStmListDecl _) -> print_match ctr nm "StmtList"
   | (Some nm,Ast.MetaFmtDecl _) -> print_match ctr nm "Fmt"
+  | (Some nm,Ast.MetaAttributeDecl _) -> print_match ctr nm "Attribute"
   | (Some nm,Ast.MetaFragListDecl _) -> print_match ctr nm "FragList"
   | (Some nm,Ast.MetaFuncDecl _) -> print_match ctr nm "Str"
   | (Some nm,Ast.MetaLocalFuncDecl _) -> print_match ctr nm "Str"
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
