Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7227159151
	for <lists+cocci@lfdr.de>; Tue, 11 Feb 2020 15:02:31 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 01BE1xpq014331;
	Tue, 11 Feb 2020 15:01:59 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A6CFF7801;
	Tue, 11 Feb 2020 15:01:59 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 84F4A77EF
 for <cocci@systeme.lip6.fr>; Tue, 11 Feb 2020 15:01:57 +0100 (CET)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:641])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 01BE1t74028154
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 11 Feb 2020 15:01:56 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id a6so4314849plm.3
 for <cocci@systeme.lip6.fr>; Tue, 11 Feb 2020 06:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ghVu4OJ3L2uII3bIe675FjO/5HT0E/BaTOy1eE/SBDk=;
 b=Xu63uOfVV77SshD8HZEjZIiRcnHXH+owM0i3VGRhS1P7+BdHi1j12sTjWkUJcqlhA2
 85s0Iq2HnOOjnA78WJjT1x2PoNRk7R0TxtENsQ2Urd5PQWdUeoXSJ4iQklZjBnhaZCmK
 mhOMNPrR1Yzf4FMEi2tDo5/tPie68ZXO2zevBrJIEjFhcBftWcBBtNwJ6b1KxjBnmyAP
 nbx/vtazk9pPeKbsLa9IE+eusp6iJh4A8q+b0xIIG3EHlWqVxZIVuSpOfcQNcxamLKqe
 oZiv5PVx+GEGQcOvfSufB4iL9kZEw5spZMuBL20FiBuGeA4mrzIOccnWtawKNFVFSGhI
 iCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ghVu4OJ3L2uII3bIe675FjO/5HT0E/BaTOy1eE/SBDk=;
 b=Wi7iUdBr8QZeQ+egcXdpvNYXq2opXmaAct97gqdMwjr0SW7iaHab+eYQVEwTpI4pW+
 bezqz7b3ad+M8W4T4+yjdKtlOHjs+iCcoCS6P8jKwV3AfPZSyojDB0WYBR5T5HOtyb0b
 eMbpOzTBXD9K2wmQ5ThjF9HsNl8d2gIC2J6lj1adGWYu6jRUua4dNkL4ffwV9Tc1X3I4
 hmjbZW/kDZY17CjTyZv0e5s2EQNvCrIRD2qdCjj+Cwimrll37fXyG4B4ouDsj1v7HgeG
 kC6O/v92yYn8etIRq6wolXKy7MlFTS1Lnq6vxIbzHwUJRsBTk+iIg1j9yyMDIKcokXtK
 rWRQ==
X-Gm-Message-State: APjAAAXq1ln9UUidig6wBlaoTRVT44iHHqLp3NBeTw6FWr5p1bJUw49v
 scbXhqowxS2zRQmk68xFnzQO/vb8
X-Google-Smtp-Source: APXvYqyeyab7EZE7U4MyususChitcHk4tIiqkVP85T9zLSHnexikQ8aDXPwep00BAKgw7ustP1kmoA==
X-Received: by 2002:a17:90a:8001:: with SMTP id
 b1mr3804254pjn.39.1581429714618; 
 Tue, 11 Feb 2020 06:01:54 -0800 (PST)
Received: from localhost.localdomain ([2405:204:22ac:7250:d1c8:6411:2f12:731d])
 by smtp.gmail.com with ESMTPSA id z26sm4203575pgu.80.2020.02.11.06.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 06:01:54 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 11 Feb 2020 19:31:35 +0530
Message-Id: <20200211140137.2304-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200211140137.2304-1-jaskaransingh7654321@gmail.com>
References: <20200211140137.2304-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 11 Feb 2020 15:01:59 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 11 Feb 2020 15:01:56 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v5 1/3] parsing_c: Align C AST and Cocci AST for
	pointer
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

For a pointer, the C parser constructed an AST dissimilar from that
of the Cocci AST. This caused failures in matching with certain
pointer types. For example, for the following case:

char *1 const *2 id;

The C AST constructed would be:
const Pointer1 -> Pointer2 -> char

The Cocci AST constructed would be:
Pointer2 -> const Pointer1 -> char

Change the pointer rule in the C parser so that an AST similar to the
Cocci AST is constructed.

Make necessary changes in the C pretty printer so that the pointer type
is printed correctly.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly      |  4 ++--
 parsing_c/pretty_print_c.ml | 15 ++++++++++-----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 8d7b761e..4c74f15a 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1333,14 +1333,14 @@ pointer:
  | tmul                   { (Ast_c.noattr,fun x -> mk_ty (Pointer x) [$1]) }
  | tmul pointer
      { let (attr,ptr) = $2 in
-       (attr,fun x -> mk_ty (Pointer (ptr x)) [$1]) }
+       (attr,fun x -> ptr (mk_ty (Pointer x) [$1])) }
  | tmul type_qualif_list
      { let (attr,tq) = $2 in
        (attr,fun x -> (tq.qualifD, mk_tybis (Pointer x) [$1]))}
  | tmul type_qualif_list pointer
      { let (attr1,tq) = $2 in
        let (attr2,ptr) = $3 in
-       (attr1@attr2,fun x -> (tq.qualifD, mk_tybis (Pointer (ptr x)) [$1])) }
+       (attr1@attr2,fun x -> ptr (tq.qualifD, mk_tybis (Pointer x) [$1])) }
 
 tmul:
    TMul { $1 }
diff --git a/parsing_c/pretty_print_c.ml b/parsing_c/pretty_print_c.ml
index a2e35588..f4821d5c 100644
--- a/parsing_c/pretty_print_c.ml
+++ b/parsing_c/pretty_print_c.ml
@@ -804,11 +804,14 @@ and pp_string_format (e,ii) =
              (FunctionType (return=void, params=int i) *)
           (*WRONG I THINK, use left & right function *)
           (* bug: pp_type_with_ident_rest None t;      print_ident ident *)
+          pp_type_left t;
           pr_elem i;
-          iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
+          iiqu +>
+          List.iter (* le const est forcement apres le '*' *)
+            (function x -> pr_space(); pr_elem x);
           if iiqu <> [] || get_comments_after i <> []
           then pr_space();
-          pp_type_with_ident_rest ident t attrs Ast_c.noattr;
+          print_ident ident
 
       (* ugly special case ... todo? maybe sufficient in practice *)
       | (ParenType ttop, [i1;i2]) ->
@@ -885,11 +888,13 @@ and pp_string_format (e,ii) =
       match ty, iity with
 	(NoType,_) -> failwith "pp_type_left: unexpected NoType"
       | (Pointer t, [i]) ->
+          pp_type_left t;
           pr_elem i;
-          iiqu +> List.iter pr_elem; (* le const est forcement apres le '*' *)
+          iiqu +>
+          List.iter (* le const est forcement apres le '*' *)
+            (function x -> pr_space(); pr_elem x);
           if iiqu <> [] || get_comments_after i <> []
-          then pr_space();
-          pp_type_left t
+          then pr_space()
 
       | (Array (eopt, t), [i1;i2]) -> pp_type_left t
       | (FunctionType (returnt, paramst), [i1;i2]) -> pp_type_left returnt
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
