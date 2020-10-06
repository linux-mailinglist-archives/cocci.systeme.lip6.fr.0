Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A780128520A
	for <lists+cocci@lfdr.de>; Tue,  6 Oct 2020 21:05:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 096J580m023378;
	Tue, 6 Oct 2020 21:05:08 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 3FF9D77BF;
	Tue,  6 Oct 2020 21:05:08 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6A59444D2
 for <cocci@systeme.lip6.fr>; Tue,  6 Oct 2020 21:05:04 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:442])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 096J53I2003866
 for <cocci@systeme.lip6.fr>; Tue, 6 Oct 2020 21:05:03 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id w21so9575197pfc.7
 for <cocci@systeme.lip6.fr>; Tue, 06 Oct 2020 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=0Yw4y12mYXqqzBAefSKmQPErnuJA8Bd/3bClQhft1f4=;
 b=J9sFhc+1KcqbpLQ7ekiat8iAZKtmnnrkH4W2rtwSKcoBnqWye7OXmkWmVFTIzIrF64
 95oHtrlypE1jdVQrzKddZSnaTMd8mmVZcR5aWKDer3JR/AHJ6RVz6fVaHYJL25G6owJV
 grag7y4YkMTjqNAQoXtGNQ40dXREPsToFLFJfdRiTAocUgEgrGcsdFvWKuY7IKEkEM3F
 I9XeTXM7rA+5I5HcJe8NoCL/nndWYFgIOVLb8Uyvifp7MUieznep8mIHzJ8fwuS5Y1+j
 ugUF0UOnN2yMZ4l1bp5WfbWv3UsBj56FoQFOs5X3yN+ozLTLzYcRX1Yv09UgKQIebypF
 Rqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=0Yw4y12mYXqqzBAefSKmQPErnuJA8Bd/3bClQhft1f4=;
 b=V0+NMbQ1upcC7QgNJYfnDXA+gEr0QHxP1WaynKboP0LvpZPlKd8uprt+HN3N2fmIPa
 0DozHcAUDS3yAO4ewNaEjBebZ/wFSVFDUSMXJktsaJa9FaejrWYWvtl5Bqs2lHdFoI2+
 /Is4nq2DIEFCYqQFBBM2RYevPbYBfwcAPDgk/1Ew/0wHoLqz03qLqWbDhvedQUf68G5B
 rUeqwwirdI90yVwMs3BcnKediA3CsM+64qRv1P5F5ZIFEGOZuFcbe75bzszdhIVhFRFc
 idaAtTZ8IBGeVNekVY+WEZt04dFXL8R26O8RAm4AW0Uxr3KTmmTBaB2L2dYi+K3+QVyx
 6Lcg==
X-Gm-Message-State: AOAM530om/dUJUZmJ9kBdJ+aOCnYtaum76hf7p3qPcBHvr6F919c+yhT
 BgFL0wUzCndXb8aYEyfvk84=
X-Google-Smtp-Source: ABdhPJwcQ61R1577YVbspYVyB7F5RVUxCM47PqwOQFHeyVaG+sJacA66GKFM4l9CoXNElUhnhfb8Hg==
X-Received: by 2002:a63:ef4f:: with SMTP id c15mr5349356pgk.140.1602011102920; 
 Tue, 06 Oct 2020 12:05:02 -0700 (PDT)
Received: from adolin ([49.207.211.213])
 by smtp.gmail.com with ESMTPSA id q6sm4640246pfn.10.2020.10.06.12.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 12:05:02 -0700 (PDT)
Date: Wed, 7 Oct 2020 00:34:57 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: Julia.Lawall@lip6.fr
Message-ID: <cover.1602010816.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 06 Oct 2020 21:05:12 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Tue, 06 Oct 2020 21:05:04 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
Cc: michal.lkml@markovi.net, linux-doc@vger.kernel.org, Gilles.Muller@lip6.fr,
        corbet@lwn.net, nicolas.palix@imag.fr, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: [Cocci] [PATCH 0/2 v2] Improve Coccinelle Parallelisation
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

Coccinelle utilises all available threads to implement parallelisation.
However, this results in a decrease in performance.

This patchset aims to improve performance by modifying cocciccheck to
use at most one thread per core by default.

Sumera Priyadarsini (2):
  scripts: coccicheck: Change default value for parallelism
  Documentation: Coccinelle: Modify parallelisation information in docs

 Documentation/dev-tools/coccinelle.rst | 4 ++--
 scripts/coccicheck                     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.25.1

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
