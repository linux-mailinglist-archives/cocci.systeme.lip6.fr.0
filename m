Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 251B822DF3C
	for <lists+cocci@lfdr.de>; Sun, 26 Jul 2020 14:53:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06QCqVax019442;
	Sun, 26 Jul 2020 14:52:31 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id ABF97777B;
	Sun, 26 Jul 2020 14:52:31 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8D6FE3F6C
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:52:26 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06QCqPAm028500
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 26 Jul 2020 14:52:26 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id F063A263ACB
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Sun, 26 Jul 2020 18:21:09 +0530
Message-Id: <20200726125141.17787-12-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200726125141.17787-1-jaskaran.singh@collabora.com>
References: <20200726125141.17787-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:52:31 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 26 Jul 2020 14:52:26 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 11/43] parsing_c: unparse_hrule: Reflect
	MetaAttributeVal
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

MetaAttributeVal is added to the C AST. Reflect these changes in
unparse_hrule.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_c/unparse_hrule.ml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/parsing_c/unparse_hrule.ml b/parsing_c/unparse_hrule.ml
index 4d7ba93cc..9d6421f31 100644
--- a/parsing_c/unparse_hrule.ml
+++ b/parsing_c/unparse_hrule.ml
@@ -251,6 +251,7 @@ let print_extra_typedefs pr env =
       | Ast_c.MetaFieldListVal(fields) ->
 	  Visitor_c.vk_struct_fields bigf fields
       | Ast_c.MetaFmtVal(fmt) -> Visitor_c.vk_string_format bigf fmt
+      | Ast_c.MetaAttributeVal(attr) -> Visitor_c.vk_attribute bigf attr
       | Ast_c.MetaFragListVal(frags) ->
 	  Visitor_c.vk_string_fragments bigf frags
       | Ast_c.MetaStmtVal(stm,_,_) -> Visitor_c.vk_statement bigf stm
@@ -313,6 +314,8 @@ let rename argids env =
 	   Ast_c.MetaFieldListVal(Visitor_c.vk_struct_fields_s bigf stm)
        | Ast_c.MetaFmtVal(fmt) ->
 	   Ast_c.MetaFmtVal(Visitor_c.vk_string_format_s bigf fmt)
+       | Ast_c.MetaAttributeVal(attr) ->
+	   Ast_c.MetaAttributeVal(Visitor_c.vk_attribute_s bigf attr)
        | Ast_c.MetaFragListVal(frags) ->
 	   Ast_c.MetaFragListVal(Visitor_c.vk_string_fragments_s bigf frags)
        | Ast_c.MetaStmtVal(stm,original,ty) ->
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
