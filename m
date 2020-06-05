Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E5C1EF991
	for <lists+cocci@lfdr.de>; Fri,  5 Jun 2020 15:47:23 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 055DipSF001856;
	Fri, 5 Jun 2020 15:44:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4675D7828;
	Fri,  5 Jun 2020 15:44:51 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AB7963F9A
 for <cocci@systeme.lip6.fr>; Fri,  5 Jun 2020 15:44:49 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:1044])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 055DimeW001244
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 5 Jun 2020 15:44:49 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id nm22so2604584pjb.4
 for <cocci@systeme.lip6.fr>; Fri, 05 Jun 2020 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ehxusg0wFvuEPrRhtjKOUQLdOEx3QD4aVXqqLyIFDM8=;
 b=fXh5W24xVbDFtDPiVvviSlkBRaf+Sv1cHqvakHXrRE6KZFBM0s6WtLg+kTEXG4Pw8A
 /Q375nS9AfsftgD0X8Rg6upI1Yx9e28HMsvFbSNjqStN/bPYQnKGK98u0GZb9XaPHzB/
 2ep5MKz5Ek0yQCbx8/pOqqq8pLEEyd8nDRlymGDYMyOLthfzRztmKpzjznrg8zJUXk8f
 lJ7fY1pM2x5tGCyP8CleRYibABADqpNcvfUhlhRFPYzZr0TStZmggKlTwudO8/JbtfWF
 0+mEyV6OWRUhu6rjfKjZFahh+nFxleInWSBSxa2vUZymPEPLKuIWBfU12v9UnFKI98Xt
 wm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ehxusg0wFvuEPrRhtjKOUQLdOEx3QD4aVXqqLyIFDM8=;
 b=GFpThE2clv06nz0xuNA4RIBi78inBgjYkH6WUuzNiNaMSXs4VoopNpnX/GAe66ULo3
 BcVTrPGYcLdiYy74yAbtwV7tPj9fE/us452Zvtminnyr/HxDZyNm6eLTjYUEdGmbqzMn
 sV66UyPUi8NurEMB+kX759o5nSDthy7JYak2/S2qYFiR0ng+6U2KwacAOTpz0DHNP0Hm
 mmLRTl29wPzYOOsuHpTIp40UdlbBauEo+0roOCLMzjCt47QO29RajpNVGbmArA2ulnbI
 fzLAO+nvR2qmTd3x4+NfgyWPNXihRbOJ6GNfbPOU5p75Rc5JGDuUFhB5b54LN7mN2hfa
 6oAg==
X-Gm-Message-State: AOAM531VN+pI6F6FQyodVN6bSLhgPysmX6oIwstbM8qW08rI8tY+MjyS
 WYXLZLdpagFhx7jWg5wGMSIeiT+ETq0=
X-Google-Smtp-Source: ABdhPJxcaxdE16027mZpA3O8NkW5nAOngcRZ85miMBVLUqGFQlYwHifv4G36TqtC45TCLTGrIgHZGQ==
X-Received: by 2002:a17:902:684e:: with SMTP id
 f14mr10147871pln.328.1591364687326; 
 Fri, 05 Jun 2020 06:44:47 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:46 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:19 +0530
Message-Id: <20200605134322.15307-12-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 05 Jun 2020 15:44:51 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Fri, 05 Jun 2020 15:44:49 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cocci] [PATCH v4 11/14] parsing_c: parser: Add MacroDecl end
	attributes production
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

Add a production for macro declaration end attributes. This parses the
following C code from Linux v5.6-rc7:

  arch/x86/kernel/nmi_selftest.c:

	static DECLARE_BITMAP(nmi_ipi_mask, NR_CPUS) __initdata;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 3412c34e..71e58e5b 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1576,15 +1576,16 @@ decl2:
      }
  /*(* cppext: *)*/
 
- | storage_const_opt TMacroDecl TOPar argument_list TCPar TPtVirg
+ | storage_const_opt TMacroDecl TOPar argument_list TCPar end_attributes_opt
+   TPtVirg
      { function _ ->
        match $1 with
 	 Some (sto,stoii) ->
 	   MacroDecl
-	     ((sto, fst $2, $4, true), (snd $2::$3::$5::$6::fakeInfo()::stoii))
+	     ((sto, fst $2, $4, true), (snd $2::$3::$5::$7::fakeInfo()::stoii))
        | None ->
 	   MacroDecl
-	     ((NoSto, fst $2, $4, true), [snd $2;$3;$5;$6;fakeInfo()]) }
+	     ((NoSto, fst $2, $4, true), [snd $2;$3;$5;$7;fakeInfo()]) }
 
  | storage_const_opt
      TMacroDecl TOPar argument_list TCPar teq initialize TPtVirg
-- 
2.21.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
