Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E341E0100
	for <lists+cocci@lfdr.de>; Sun, 24 May 2020 19:22:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 04OHLLVb016822;
	Sun, 24 May 2020 19:21:21 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7E3A13D0F;
	Sun, 24 May 2020 19:21:21 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B698E3D0F
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 19:21:19 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1043])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 04OHLHlk026637
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 19:21:18 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id fs4so634659pjb.5
 for <cocci@systeme.lip6.fr>; Sun, 24 May 2020 10:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QsFX72lr0e8Pu1zQ3lxfSEew5DFVMstmrOXmS8DSUE=;
 b=U9i4BM3ruMNkdp2LVTxnKGgguUB2h3bIl/ieyxjQ9GX2PAGPBwSEWNHyT9MwdKufGm
 ti/1285suQInLhAFQcRqQMykKmVrVpK21LBXiea2EWgOyim7xCG4GCXGsv7u0g6Nwl6D
 8zL+i86HKbKhN9PS2qybVwxygJR5tjN8tQbRhTCm5AsYPf6bZxU6rpw/Vk/Jj7+gV1o4
 v83qQOV4QG1Tg8NnrHxMpdR8qiC+yWoOzOpLOT6kHjGaQZaJDyDhZ0TLMGVHWq4kik+a
 mIoCLfUgJ62CdjxnJD1w2ROXGOOqvvAuIFolL6yQsBAYVT7p+QcbCkCKV7KdQFjDH1uB
 tSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QsFX72lr0e8Pu1zQ3lxfSEew5DFVMstmrOXmS8DSUE=;
 b=D64/4XzMHCmzzbTbO4mmX9+2LGKbrvtJ0H2I+1hH4lirwTLVm2W4P09nwV6tw5bspS
 H75Izi5DEhs1ubv3tkiZcMNcrtIkuKc0n06UyJ12BD4OFwvzE0JSuHpnEWvWYiMfhs91
 Dfj168+A+rIPT71gxX6JHxbBkGn395SaWI/GordZbBlhCpHPG4a6bzd7P8hiy7Li/ywD
 bvuGzMPzXfvL3DH+29RceVgN/AwxO2qjTPvg6c+FUME9q4ZgRkyx8zx4LDOMZM2XWCg0
 PY6SzPu2BaxMK9vN30QvYqATI1Yse9714/SW31uN2oPOeIve54Ju14GIxkvXz65Wz6G0
 qg7A==
X-Gm-Message-State: AOAM533vgUBSIAIEdYg9R/O2JM6yUad67bIl16aKBOXLyXuattydNRKP
 MhnrMcTEU55j5nm2AIOvRjOfpYn3Zmo=
X-Google-Smtp-Source: ABdhPJxvr77hNcpbfLohfPNplr+mVghPHDS+Ar/6Sp8X+wxWaFCfVqOlu+BFz56xm4Qba729GgJzkQ==
X-Received: by 2002:a17:90a:e54c:: with SMTP id
 ei12mr15709262pjb.129.1590340877260; 
 Sun, 24 May 2020 10:21:17 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.54])
 by smtp.gmail.com with ESMTPSA id d9sm6556497pfn.72.2020.05.24.10.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:21:16 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 24 May 2020 22:49:20 +0530
Message-Id: <20200524171935.2504-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
References: <20200524171935.2504-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 24 May 2020 19:21:21 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Sun, 24 May 2020 19:21:19 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH 15/30] parsing_cocci: pretty_print_cocci: Reflect
	Macrodecl attributes
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

Macrodecl attributes are added to the SmPL AST. Reflect these changes in
pretty_print_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/pretty_print_cocci.ml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/parsing_cocci/pretty_print_cocci.ml b/parsing_cocci/pretty_print_cocci.ml
index 7628882b..0046737e 100644
--- a/parsing_cocci/pretty_print_cocci.ml
+++ b/parsing_cocci/pretty_print_cocci.ml
@@ -565,10 +565,13 @@ and declaration d =
       parameter_list params; varargs va;
       close_box(); mcode print_string rp1;
       mcode print_string sem
-  | Ast.MacroDecl(stg,name,lp,args,rp,sem) ->
+  | Ast.MacroDecl(stg,name,lp,args,rp,attr,sem) ->
       print_option (mcode storage) stg; ident name; mcode print_string_box lp;
       dots (function _ -> ()) expression args;
-      close_box(); mcode print_string rp; mcode print_string sem
+      close_box(); mcode print_string rp;
+      (if not (attr = []) then print_string " ");
+      print_between print_space (mcode print_string) attr;
+      mcode print_string sem
   | Ast.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) ->
       print_option (mcode storage) stg; ident name; mcode print_string_box lp;
       dots (function _ -> ()) expression args;
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
