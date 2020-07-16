Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7282D22235C
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:03:27 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD21ea000410;
	Thu, 16 Jul 2020 15:02:01 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 767343F6C;
	Thu, 16 Jul 2020 15:02:01 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A344C7779
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:01:58 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD1v3v001392
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:01:58 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 0929B2A0BFF
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:30:05 +0530
Message-Id: <20200716130016.23729-15-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716130016.23729-1-jaskaran.singh@collabora.com>
References: <20200716130016.23729-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:02:01 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:01:58 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 14/24] parsing_cocci: context_neg: Reflect
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
context_neg.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/context_neg.ml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/parsing_cocci/context_neg.ml b/parsing_cocci/context_neg.ml
index 6a04f49b..a0d52e9a 100644
--- a/parsing_cocci/context_neg.ml
+++ b/parsing_cocci/context_neg.ml
@@ -46,6 +46,7 @@ let set_mcodekind x mcodekind =
   | Ast0.ForInfoTag(d) -> Ast0.set_mcodekind d mcodekind
   | Ast0.CaseLineTag(d) -> Ast0.set_mcodekind d mcodekind
   | Ast0.StringFragmentTag(d) -> Ast0.set_mcodekind d mcodekind
+  | Ast0.AttributeTag(d) -> Ast0.set_mcodekind d mcodekind
   | Ast0.TopTag(d) -> Ast0.set_mcodekind d mcodekind
   | Ast0.IsoWhenTag(_) -> failwith "only within iso phase"
   | Ast0.IsoWhenTTag(_) -> failwith "only within iso phase"
@@ -81,6 +82,7 @@ let set_index x index =
   | Ast0.ForInfoTag(d) -> Ast0.set_index d index
   | Ast0.CaseLineTag(d) -> Ast0.set_index d index
   | Ast0.StringFragmentTag(d) -> Ast0.set_index d index
+  | Ast0.AttributeTag(d) -> Ast0.set_index d index
   | Ast0.TopTag(d) -> Ast0.set_index d index
   | Ast0.IsoWhenTag(_) -> failwith "only within iso phase"
   | Ast0.IsoWhenTTag(_) -> failwith "only within iso phase"
@@ -115,6 +117,7 @@ let get_index = function
   | Ast0.ForInfoTag(d) -> Index.forinfo d
   | Ast0.CaseLineTag(d) -> Index.case_line d
   | Ast0.StringFragmentTag(d) -> Index.string_fragment d
+  | Ast0.AttributeTag(d) -> Index.attribute d
   | Ast0.TopTag(d) -> Index.top_level d
   | Ast0.IsoWhenTag(_) -> failwith "only within iso phase"
   | Ast0.IsoWhenTTag(_) -> failwith "only within iso phase"
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
