Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 173E521C2F8
	for <lists+cocci@lfdr.de>; Sat, 11 Jul 2020 09:02:03 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06B717XY029372;
	Sat, 11 Jul 2020 09:01:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id EA09A781D;
	Sat, 11 Jul 2020 09:01:06 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 48C1C3D0F
 for <cocci@systeme.lip6.fr>; Sat, 11 Jul 2020 09:01:05 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06B714JZ015623
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 11 Jul 2020 09:01:04 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 15E552A5A12
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Sat, 11 Jul 2020 12:30:35 +0530
Message-Id: <20200711070035.8483-1-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 11 Jul 2020 09:01:09 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sat, 11 Jul 2020 09:01:04 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH] parsing_cocci: parse_cocci: Extend
	is_permissible_proto list
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

Add more tokens (binary operators and colon) to the match ladder in
is_permissible_proto. These cases would otherwise cause parsing errors
for function calls after these tokens.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/parse_cocci.ml | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/parse_cocci.ml b/parsing_cocci/parse_cocci.ml
index 598cdc0b..e30039dc 100644
--- a/parsing_cocci/parse_cocci.ml
+++ b/parsing_cocci/parse_cocci.ml
@@ -1052,7 +1052,8 @@ let find_function_names l =
       ((PC.TMid0(_),_) | (PC.TAnd0(_),_))::
       (PC.TOPar0(_),_)::_ -> false
     | (PC.TOPar0(_),_)::rest
-    | (PC.TCPar0(_),_)::rest -> is_permissible_proto rest
+    | (PC.TCPar0(_),_)::rest
+    | (PC.TMul(_),_)::rest -> is_permissible_proto rest
     | x::rest when is_mid x ->
         let rec loop = function
           [] -> false
@@ -1076,6 +1077,21 @@ let find_function_names l =
     | (PC.TMetaId(_),_)::_
     | (PC.TMetaLocalIdExp(_),_)::_
     | (PC.TEq(_),_)::_
+    | (PC.TEqEq(_),_)::_
+    | (PC.TNotEq(_),_)::_
+    | (PC.TShROp(_),_)::_
+    | (PC.TShLOp(_),_)::_
+    | (PC.TSub(_),_)::_
+    | (PC.TPlus(_),_)::_
+    | (PC.TMinus(_),_)::_
+    | (PC.TDmOp(_),_)::_
+    | (PC.TAnd(_),_)::_
+    | (PC.TOr(_),_)::_
+    | (PC.TXor(_),_)::_
+    | (PC.TLogOp(_),_)::_
+    | (PC.TAndLog(_),_)::_
+    | (PC.TOrLog(_),_)::_
+    | (PC.TDotDot(_),_)::_
     | (PC.TPtrOp(_),_)::_
     | (PC.TEllipsis(_),_)::_
     | (PC.TOEllipsis(_),_)::_
@@ -1086,6 +1102,7 @@ let find_function_names l =
     | (PC.TOBrace(_),_)::_
     | (PC.TCBrace(_),_)::_
     | (PC.TOPar(_),_)::_
+    | (PC.TOCro(_),_)::_
     | (PC.TIdent(_),_)::_ -> false
     | _ -> true in
   let decl_or_proto clt info bef aft =
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
