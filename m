Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD80222355
	for <lists+cocci@lfdr.de>; Thu, 16 Jul 2020 15:03:07 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06GD1qdU001623;
	Thu, 16 Jul 2020 15:01:58 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 872D83F6C;
	Thu, 16 Jul 2020 15:01:58 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C7E7E7779
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:01:55 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06GD1tee000604
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 16 Jul 2020 15:01:55 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: jaskaran_singh) with ESMTPSA id 1AB1B2A0BFF
From: Jaskaran Singh <jaskaran.singh@collabora.com>
To: cocci@systeme.lip6.fr
Date: Thu, 16 Jul 2020 18:30:03 +0530
Message-Id: <20200716130016.23729-13-jaskaran.singh@collabora.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200716130016.23729-1-jaskaran.singh@collabora.com>
References: <20200716130016.23729-1-jaskaran.singh@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jul 2020 15:01:58 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Thu, 16 Jul 2020 15:01:55 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Subject: [Cocci] [PATCH 12/24] parsing_cocci: iso_pattern: Reflect
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
iso_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaran.singh@collabora.com>
---
 parsing_cocci/iso_pattern.ml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/parsing_cocci/iso_pattern.ml b/parsing_cocci/iso_pattern.ml
index 5200a4c4..24c2927c 100644
--- a/parsing_cocci/iso_pattern.ml
+++ b/parsing_cocci/iso_pattern.ml
@@ -92,6 +92,9 @@ let anything_equal = function
   | (Ast0.StringFragmentTag(d1),Ast0.StringFragmentTag(d2)) ->
       (strip_info.VT0.rebuilder_rec_string_fragment d1) =
       (strip_info.VT0.rebuilder_rec_string_fragment d2)
+  | (Ast0.AttributeTag(d1),Ast0.AttributeTag(d2)) ->
+      (strip_info.VT0.rebuilder_rec_attribute d1) =
+      (strip_info.VT0.rebuilder_rec_attribute d2)
   | (Ast0.TopTag(d1),Ast0.TopTag(d2)) ->
       (strip_info.VT0.rebuilder_rec_top_level d1) =
       (strip_info.VT0.rebuilder_rec_top_level d2)
@@ -2946,6 +2949,8 @@ let rec rewrap_anything = function
       Ast0.CaseLineTag(rewrap.VT0.rebuilder_rec_case_line d)
   | Ast0.StringFragmentTag(d) ->
       Ast0.StringFragmentTag(rewrap.VT0.rebuilder_rec_string_fragment d)
+  | Ast0.AttributeTag(d) ->
+      Ast0.AttributeTag(rewrap.VT0.rebuilder_rec_attribute d)
   | Ast0.TopTag(d) -> Ast0.TopTag(rewrap.VT0.rebuilder_rec_top_level d)
   | Ast0.IsoWhenTag(_) | Ast0.IsoWhenTTag(_) | Ast0.IsoWhenFTag(_) ->
       failwith "only for isos within iso phase"
-- 
2.21.3

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
