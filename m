Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 651DA218819
	for <lists+cocci@lfdr.de>; Wed,  8 Jul 2020 14:54:57 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 068CsTXq026049;
	Wed, 8 Jul 2020 14:54:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 46A2B7860;
	Wed,  8 Jul 2020 14:54:30 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7CC857849
 for <cocci@systeme.lip6.fr>; Wed,  8 Jul 2020 14:54:27 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 068CsQMs004361
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 8 Jul 2020 14:54:27 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id DD6002A577C
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Wed,  8 Jul 2020 18:23:45 +0530
Message-Id: <20200708125357.8998-10-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200708125357.8998-1-jaskaran.singh@collabora.com>
References: <20200708125357.8998-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 14:54:32 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 08 Jul 2020 14:54:27 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Subject: [Cocci] [PATCH 09/20] parsing_cocci: index: Wrap SmPL Attributes
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

Attributes are wrapped in the SmPL AST. Assign the Attribute variant an
index.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/index.ml  | 6 +++++-
 parsing_cocci/index.mli | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/index.ml b/parsing_cocci/index.ml
index 8df048dd..cb3ac7ec 100644
--- a/parsing_cocci/index.ml
+++ b/parsing_cocci/index.ml
@@ -5,7 +5,7 @@
  *)
 
 (* create an index for each constructor *)
-(* current max is 192, also unused: 8-9, 15, 39, 40, 42, 46, 57, 65, 85-86,
+(* current max is 192, also unused: 8-9, 15, 40, 42, 46, 57, 65, 85-86,
  113-115, 140, 162 *)
 
 (* doesn't really work - requires that identical terms with no token
@@ -229,6 +229,10 @@ let string_fragment f =
   | Ast0.Strdots(dots) -> [168]
   | Ast0.MetaFormatList(pct,name,cstr,lenname) -> [169]
 
+let attribute a =
+  match Ast0.unwrap a with
+    Ast0.Attribute(attr) -> [39]
+
 let top_level t =
   match Ast0.unwrap t with
     Ast0.NONDECL(stmt) -> [90]
diff --git a/parsing_cocci/index.mli b/parsing_cocci/index.mli
index 4f86f5ba..e3c10177 100644
--- a/parsing_cocci/index.mli
+++ b/parsing_cocci/index.mli
@@ -28,4 +28,5 @@ val forinfo : Ast0_cocci.forinfo -> int list
 val pragmainfo : Ast0_cocci.pragmainfo -> int list
 val case_line : Ast0_cocci.case_line -> int list
 val string_fragment : Ast0_cocci.string_fragment -> int list
+val attribute : Ast0_cocci.attr -> int list
 val top_level : Ast0_cocci.top_level -> int list
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
