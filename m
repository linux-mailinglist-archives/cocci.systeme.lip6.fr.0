Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E94E931AE20
	for <lists+cocci@lfdr.de>; Sat, 13 Feb 2021 22:38:40 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11DLc6KK022362;
	Sat, 13 Feb 2021 22:38:07 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DF3CF77EB;
	Sat, 13 Feb 2021 22:38:06 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 89AC974AF
 for <cocci@systeme.lip6.fr>; Fri, 12 Feb 2021 00:27:49 +0100 (CET)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11BNRmqA012322
 for <cocci@systeme.lip6.fr>; Fri, 12 Feb 2021 00:27:49 +0100 (CET)
Received: by mail-ot1-f53.google.com with SMTP id i20so6842901otl.7
 for <cocci@systeme.lip6.fr>; Thu, 11 Feb 2021 15:27:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NMJ7yLd9O23CBO6jbidyP4gLEKA1R1vMVgKZt27Rrho=;
 b=J6XUW0TzIy5gxVicHg9K9zwGE7+8jC22rfmZvz+DbKNPQca73V7cpCq+lNsd+M5BGO
 33+LiuPFs+bXv8UfEPmnv3GSQqZfpAMa+cVgZMtCE8Qz3WXxlchITrC3uJXgo7qKb8jC
 tbyR1yl3qWlM098zsBygI675e9FTZh2BUB/ckvetZvaooAFDYyqwtXNPoStXo9TM0Amr
 CM0rVScktxDgG69gwi3FZXiLlVQ7XXl3IeENOdsI4bVYUAqW+3/cgNVVa1xp67xSOOCL
 tKIm4YltFUDkM8ySqnEdxiVt2u/DpDQHpHlfkxOMclsBeSWjiG0G+eJV60F2mYz35Z03
 /jqA==
X-Gm-Message-State: AOAM533rk6hMXVxL1jnF7Fn5Xi3fSNkF7qJ4jbXVPZKkMUt0l1R4vwkl
 3MbkfCScM36CknTWgdnIDw==
X-Google-Smtp-Source: ABdhPJxCLDZrG4wjSzEe3ksZoou3d9Y2oSOGUfFU4jjPmhV2WnoDeeXu5PQ90Om+6OiCd4FYz8Tnog==
X-Received: by 2002:a9d:74c6:: with SMTP id a6mr250282otl.369.1613086068486;
 Thu, 11 Feb 2021 15:27:48 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id s18sm1283922oih.53.2021.02.11.15.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 15:27:47 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Date: Thu, 11 Feb 2021 17:27:43 -0600
Message-Id: <20210211232745.1498137-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 13 Feb 2021 22:38:12 +0100 (CET)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 12 Feb 2021 00:27:49 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Sat, 13 Feb 2021 22:38:04 +0100
Cc: Felipe Balbi <balbi@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>,
        Patrice Chotard <patrice.chotard@st.com>, linux-kernel@vger.kernel.org,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org, cocci@systeme.lip6.fr,
        linux-arm-kernel@lists.infradead.org
Subject: [Cocci] [PATCH v2 0/2] of: of_device.h cleanups
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

This is a couple of cleanups for of_device.h. They fell out from my
attempt at decoupling of_device.h and of_platform.h which is a mess
and I haven't finished, but there's no reason to wait on these.

Rob

Rob Herring (2):
  of: Remove of_dev_{get,put}()
  driver core: platform: Drop of_device_node_put() wrapper

 arch/powerpc/platforms/pseries/ibmebus.c |  4 ++--
 drivers/base/platform.c                  |  2 +-
 drivers/net/ethernet/ibm/emac/core.c     | 15 ++++++++-------
 drivers/of/device.c                      | 21 ---------------------
 drivers/of/platform.c                    |  4 ++--
 drivers/of/unittest.c                    |  2 +-
 drivers/usb/dwc3/dwc3-st.c               |  2 +-
 include/linux/of_device.h                | 10 ----------
 scripts/coccinelle/free/put_device.cocci |  1 -
 9 files changed, 15 insertions(+), 46 deletions(-)

-- 
2.27.0

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
