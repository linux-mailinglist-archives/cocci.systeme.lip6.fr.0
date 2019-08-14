Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F948CE5D
	for <lists+cocci@lfdr.de>; Wed, 14 Aug 2019 10:27:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7E8Qlmb000900;
	Wed, 14 Aug 2019 10:26:48 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 663A077AA;
	Wed, 14 Aug 2019 10:26:47 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 478ED768E
 for <cocci@systeme.lip6.fr>; Wed, 14 Aug 2019 08:36:31 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:441] (may be forged))
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7E6aTEM026645
 for <cocci@systeme.lip6.fr>; Wed, 14 Aug 2019 08:36:30 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id d85so2495140pfd.2
 for <cocci@systeme.lip6.fr>; Tue, 13 Aug 2019 23:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=V2ZJmMM7eBUrb1Y12nRIIaugrWodscFeaE9AP4JG/Zg=;
 b=Gr/yUIA7h/3eBDYc9/YH3PmK0TnssS6CO/9hFNunLAWWczG3OiVHN4WIIgL3E9ZCpt
 lxw0s7tI4ERoXSIwh3JMsdgc8zNzPjnA6BXgqeWAmqEyh+LbCMXm65+O4nT6k1c31e4G
 72a+RzjyGS+EkSW5x52rptXOtidXTsKAuxWhyJ3b6xCpOT6ucihhvpEg52ywhW82gF/O
 HmWN/pIGHF5t5B5reCnO/nsCfzeJAwUmX5rfj3UfluGG3M6/UTPt0Rx+R75a3hwPVGGS
 CEB7dg3ncNyljnIstqsOyQ3HSCSlywswvj4u3icgmk4pUqxyXQc3S7rYfldNhw5/Vge5
 lm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V2ZJmMM7eBUrb1Y12nRIIaugrWodscFeaE9AP4JG/Zg=;
 b=EO9vFo61EcYTWXEM19Yp3UktGs6xPAITgetihadQMS7m65O9JXimtnCQw52tqJbsK1
 T4BWrHV0JiB+4PDAOqwVWIicXPSKqyMQErXURATBZq8emMG7ldoO0Xz2A0i6eedbxP72
 28qSU3X98iVcoo1zAOKnymS84RmUrKeQz7Ab9plKYDfUdLd/+MH3JfyJ5uHSWaYpTGu5
 aqZyMLuswJkSKNMynLzbhtUaruqFhbRHTxBeeuLnjfCnrC3T30pO9i0Y+YVnByY98scB
 tCfeA3deBMjbetOmYh5ARREtXLmCjGJugueUPykKwS9Uo11dd142Lj+DDL1KGEAQenfi
 +Lfg==
X-Gm-Message-State: APjAAAUBpoVexJuKoO+98cVPpoLBkAost29ICen/nmgsTTY6OU69FVic
 t1F8UyxFzqyk3oAM/sUB8z4=
X-Google-Smtp-Source: APXvYqw/2y0dZHWefWOjTwta+m4FUhziJYRwexQISdGldO7ge/xr1KdLXo0S4VRw57w8u++ZXvSuxA==
X-Received: by 2002:a63:89c2:: with SMTP id
 v185mr37393202pgd.241.1565764588977; 
 Tue, 13 Aug 2019 23:36:28 -0700 (PDT)
Received: from himanshu-Vostro-3559 ([103.77.43.147])
 by smtp.gmail.com with ESMTPSA id j15sm109471223pfr.146.2019.08.13.23.36.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Aug 2019 23:36:27 -0700 (PDT)
Date: Wed, 14 Aug 2019 12:06:11 +0530
From: Himanshu Jha <himanshujha199640@gmail.com>
To: Matthias Maennich <maennich@google.com>
Message-ID: <20190814063611.GA22387@himanshu-Vostro-3559>
References: <20180716122125.175792-1-maco@android.com>
 <20190813121733.52480-1-maennich@google.com>
 <20190813121733.52480-9-maennich@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813121733.52480-9-maennich@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 14 Aug 2019 10:26:50 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 14 Aug 2019 08:36:30 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
X-Mailman-Approved-At: Wed, 14 Aug 2019 10:26:44 +0200
Cc: kstewart@linuxfoundation.org, linux-m68k@vger.kernel.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, hpa@zytor.com,
        joel@joelfernandes.org, sam@ravnborg.org, cocci@systeme.lip6.fr,
        linux-arch@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
        lucas.de.marchi@gmail.com, mingo@redhat.com, geert@linux-m68k.org,
        stern@rowland.harvard.edu, kernel-team@android.com, sspatil@google.com,
        arnd@arndb.de, linux-kbuild@vger.kernel.org, pombredanne@nexb.com,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>, tglx@linutronix.de,
        maco@android.com, michal.lkml@markovi.net, gregkh@linuxfoundation.org,
        oneukum@suse.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
        maco@google.com, jeyu@kernel.org,
        "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Subject: Re: [Cocci] [PATCH v2 08/10] scripts: Coccinelle script for
 namespace dependencies.
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

On Tue, Aug 13, 2019 at 01:17:05PM +0100, Matthias Maennich wrote:
> A script that uses the '<module>.ns_deps' file generated by modpost to
> automatically add the required symbol namespace dependencies to each
> module.
> 
> Usage:
> 1) Move some symbols to a namespace with EXPORT_SYMBOL_NS() or define
>    DEFAULT_SYMBOL_NAMESPACE
> 2) Run 'make' (or 'make modules') and get warnings about modules not
>    importing that namespace.
> 3) Run 'make nsdeps' to automatically add required import statements
>    to said modules.
> 
> This makes it easer for subsystem maintainers to introduce and maintain
> symbol namespaces into their codebase.
> 
> Co-developed-by: Martijn Coenen <maco@android.com>
> Signed-off-by: Martijn Coenen <maco@android.com>
> Signed-off-by: Matthias Maennich <maennich@google.com>
> ---

[]

>  MAINTAINERS                                 |  5 ++
>  Makefile                                    | 12 +++++
>  scripts/Makefile.modpost                    |  4 +-
>  scripts/coccinelle/misc/add_namespace.cocci | 23 +++++++++
>  scripts/nsdeps                              | 54 +++++++++++++++++++++
>  5 files changed, 97 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/coccinelle/misc/add_namespace.cocci
>  create mode 100644 scripts/nsdeps

[]

> +if [ "$SPATCH_VERSION_NUM" -lt "$SPATCH_REQ_VERSION_NUM" ] ; then
> +    echo 'spatch needs to be version 1.06 or higher'

Nitpick: 1.0.6

> +    exit 1
> +fi


-- 
Himanshu Jha
Undergraduate Student
Department of Electronics & Communication
Guru Tegh Bahadur Institute of Technology
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
