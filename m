Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E4C1BA34D
	for <lists+cocci@lfdr.de>; Mon, 27 Apr 2020 14:10:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03RC9vHa027379;
	Mon, 27 Apr 2020 14:09:58 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4897A782D;
	Mon, 27 Apr 2020 14:09:58 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id F3B127816
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 14:09:56 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:441])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03RC9t9E024405
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 14:09:56 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id x15so8935373pfa.1
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DoYSqyO22rGi0Db4CqIjpeG/yfksbrnzAwvFWBh1tCQ=;
 b=qKnDCVoO1mLBGIybMp/3g8aC8cc0y7WxPmbfl71mwLBMh1425RTTB6x2eFRTohjswd
 UTJLimGECaVkqYBmPRA6RMUL+s5psGTXamng1xMs94iNOAvUFZRND5n5I1DiC+vFAk6h
 1wmcnuqRmBHQWT0Ezi5SoBZ6cFwvYpBWLeJZzOZ/HU85tUCLFZUKFBZHKfqBnr+dnYvo
 bq74a13NS5OhEG6+x8nwJBRrfVMKOPevg6pnSlIRetk1b3xHVPwLsPlxOQD05LR9LfsD
 aHshwesuIT6G6dmfDGCZ6/F/6DRcZLFjhbETfmY97Z0uchvoICijrgNVpEP6FIeD9qZ9
 lxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DoYSqyO22rGi0Db4CqIjpeG/yfksbrnzAwvFWBh1tCQ=;
 b=KDaBAnYsNGTPxEGqbXbfsW844JNV1KNnJC8liVK57HGFCe6sQzhRCs5kn2s+s1s+Ne
 PoPj0RgHvT70AX2Z1IO8y90U53C97TDZHzf1QAd6gYfGjG+2y5w6K5bdnp3u7/sLC8A/
 enD6Ko/hMD15+3xgeWQEwBAt8XcALu0sfjJ1r1Y1IlpTIqlJpNSNqKvlaWiZWu3ZFTr+
 Ug6aHQyw77UsM2TGwiYUSfFTVAexOoZZcPaMrs2lhxcE2w4PCOrKm+j/9ig+rzwMZhbS
 gf7ZD0WTPqpjRurTy5KgWhKJoYugczdwxLbvlKrM03ROAnSrquxxjh/qfvVUF90LY7a3
 m/rQ==
X-Gm-Message-State: AGi0PuZV0Mdk7qgwZnPNXr2Ky1dELPwJIp7/yNQAkhlhKJ+btawuVQhe
 0llIuwFz2EIOU/bNKHn7tn5NTrj4YIo=
X-Google-Smtp-Source: APiQypKJEcXwY6grZhJMONF0CscEOICFfb+Vz/7i3cuVklX14CObw6yqGVnIbFEJv+zvFXQwo/nOnQ==
X-Received: by 2002:aa7:9832:: with SMTP id q18mr24948130pfl.179.1587989394648; 
 Mon, 27 Apr 2020 05:09:54 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:54 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:28 +0530
Message-Id: <20200427120834.380-18-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 14:09:58 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Mon, 27 Apr 2020 14:09:56 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 17/23] parsing_cocci: disjdistr: Reflect Parameter
	attributes
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

Parameter attributes are added to the SmPL AST. Reflect these changes in
disjdistr.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/disjdistr.ml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/disjdistr.ml b/parsing_cocci/disjdistr.ml
index 6724bb25..c868cb1c 100644
--- a/parsing_cocci/disjdistr.ml
+++ b/parsing_cocci/disjdistr.ml
@@ -259,10 +259,10 @@ and disjexp e =
 
 and disjparam p =
   match Ast.unwrap p with
-    Ast.VoidParam(ty) -> [p] (* void is the only possible value *)
-  | Ast.Param(ty,id) ->
+    Ast.VoidParam(ty,attr) -> [p] (* void is the only possible value *)
+  | Ast.Param(ty,id,attr) ->
       disjmult2 (disjty ty) (disjoption disjident id)
-	(fun ty id -> Ast.rewrap p (Ast.Param(ty,id)))
+	(fun ty id -> Ast.rewrap p (Ast.Param(ty,id,attr)))
   | Ast.AsParam(pm,asexp) -> (* as exp doesn't contain disj *)
       let pm = disjparam pm in
       List.map (function pm -> Ast.rewrap p (Ast.AsParam(pm,asexp))) pm
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
