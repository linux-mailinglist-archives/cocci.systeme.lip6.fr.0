Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCD61BA344
	for <lists+cocci@lfdr.de>; Mon, 27 Apr 2020 14:10:16 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03RC9a8h015338;
	Mon, 27 Apr 2020 14:09:36 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 99CE2782D;
	Mon, 27 Apr 2020 14:09:36 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D176C7769
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 14:09:34 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:442])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03RC9XaL015921
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 14:09:34 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id d184so8925415pfd.4
 for <cocci@systeme.lip6.fr>; Mon, 27 Apr 2020 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RAztWq6kekRCOkyGvpZmJpf2WO9JzYN+dY+xdc7Ro2U=;
 b=CkfsxmCTmljc1sxhiCrvjpQk2RmL8MCpkYTsXF2fvHgKIRxBFQHHcQin/SsE5q98oY
 oHD44kRGnsjHtFRJ5BLnZCCCOkRgeD6LkEd0TbBSBTqfgVPQSrVbsNKiTTUPpK765EcO
 LPHDON0kn85jKOS8px0VqhrZJC3p67NHnLSHbV4aoRwzpZh7yxEUDnZRhoyb3ZAcjUVI
 dVhsWN4Ff8fkmkxZAgSP/4JqKYgihjkyzZV6K+yZ4T/+ikA14iNVswgk1vwxE6yXx5sE
 k7QNPvQgA/bzV954OTo0dW3lPColhJePncJs1pWCeaUs0lJOOkp+rK1b0d/BH/zCTbIE
 bzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RAztWq6kekRCOkyGvpZmJpf2WO9JzYN+dY+xdc7Ro2U=;
 b=BVPEGBbpyuMpSoviGy26GcBfsn6aTL5upZ2frOvPTX0hV0ETnFETNHWGSS+Sjr2kuJ
 kld4pA08pw3lR8o1Yn6K8fr0ZkjdUZqMmiLB1TYZ41JJjrUWQKAHOO049o+lHwrWPFKQ
 01ukLmlNu7LV1KlDpeLF/gURVOlzDCbn0GvdgmtGM1TaFwMAs5A9+OFgBKFbiyvT/zzq
 S0+uSsMjTeqg4hRtsqykK6tO1sEVdc8TM5TMSduBB402sp8y2/aEMVMeAASmjENqMNMm
 iumLKrtigdAwNHX3yUNu9tdE0DlNvbPEzG2C4MRxPruBroR6vsKIy0Br185P6HmoOs4e
 SICQ==
X-Gm-Message-State: AGi0PuaYoafz42O99n4lhfVwKEJqrmNmQFkI5SW4jOVwMyHfoNPiXKF3
 ADcFpeUNCbCI1j9H/hunREc6I0uoBSk=
X-Google-Smtp-Source: APiQypL9yLj7lp2TPqlrxJDdS9idqoclZHpmz89Su8+bM2kYPAx/OuDapmU44edR18iNq9rGDvVAeQ==
X-Received: by 2002:a62:e213:: with SMTP id a19mr23448677pfi.180.1587989372289; 
 Mon, 27 Apr 2020 05:09:32 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:31 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:22 +0530
Message-Id: <20200427120834.380-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 27 Apr 2020 14:09:36 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Mon, 27 Apr 2020 14:09:34 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 11/23] parsing_cocci: type_infer: Reflect Parameter
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
type_infer.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/type_infer.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/type_infer.ml b/parsing_cocci/type_infer.ml
index e8aad810..495d7974 100644
--- a/parsing_cocci/type_infer.ml
+++ b/parsing_cocci/type_infer.ml
@@ -420,7 +420,7 @@ let rec propagate_types env =
       Ast0.FunDecl(_,fninfo,name,lp,params,va,rp,lbrace,body,rbrace,_) ->
 	let rec get_binding p =
 	  match Ast0.unwrap p with
-	    Ast0.Param(ty,Some id) ->
+	    Ast0.Param(ty,Some id,attr) ->
 	      List.map (function i -> (i,ty)) (strip id)
 	  | Ast0.OptParam(param) -> get_binding param
 	  | Ast0.AsParam(param,e) -> get_binding param
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
