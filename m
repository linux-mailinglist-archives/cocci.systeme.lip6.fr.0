Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC21EE955
	for <lists+cocci@lfdr.de>; Thu,  4 Jun 2020 19:22:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 054HMIgY022278;
	Thu, 4 Jun 2020 19:22:18 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 72FD87828;
	Thu,  4 Jun 2020 19:22:18 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5AA185D47
 for <cocci@systeme.lip6.fr>; Thu,  4 Jun 2020 19:22:17 +0200 (CEST)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 054HMGG5011695
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 4 Jun 2020 19:22:16 +0200 (CEST)
Received: by mail-lj1-f194.google.com with SMTP id z9so8274399ljh.13
 for <cocci@systeme.lip6.fr>; Thu, 04 Jun 2020 10:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=r3pHeafroYjCOPxLj9S1OAEXhOignYglUX2vpauVcxc=;
 b=F+z4SZL3k+HYyx1oeb6vUq1epbBv/vhYcAe9WeHql55ljqmeZv7HykswcnuHoMRyRu
 0ZVVyIjTqQTxY0b1cMnziic1Ocsfi3al2fSSWDq7ydIllQgy4ZItJmWMfbR01JL+zF3F
 GrpO2VTjRLw8Gkvi25HCzDBS08LFZriUMJOz70p5tt0HgFla3dDDzjYvIQiHvZvXilMR
 pzrru0vRY9YRFgX3zVzRX2KUyhCw+embYw+vGcdadH4OwyuZdhgPMmIWhz7kpxYISKRq
 JM1eXSG3ITz+OSTfJEm+f23er6wR9/aKOIc0fO9YbHx0ZyCpvV6dTDvzaxNszXJiMpAw
 Tp+w==
X-Gm-Message-State: AOAM533OH3yujMjO52j107sY3ecNzZVyXbSC8PoYY5oV6SBQP692EeBD
 jdNv8T4ontytewOljaJWZP8=
X-Google-Smtp-Source: ABdhPJzR3w6y4xwJqMya+Erw0kueGPzVAADeyCkwHAO0k8u5M8StttYUqCllr92usyxQaf8X6mSa0Q==
X-Received: by 2002:a2e:7303:: with SMTP id o3mr2845188ljc.100.1591291336083; 
 Thu, 04 Jun 2020 10:22:16 -0700 (PDT)
Received: from [10.68.32.147] (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.gmail.com with ESMTPSA id 3sm57077lfq.55.2020.06.04.10.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 10:22:14 -0700 (PDT)
To: Julia Lawall <julia.lawall@inria.fr>
References: <20200604140805.111613-1-efremov@linux.com>
 <alpine.DEB.2.21.2006041614300.2577@hadrien>
 <a188acce-348b-b106-9180-708c3050ef8d@linux.com>
 <alpine.DEB.2.21.2006041749520.2577@hadrien>
From: Denis Efremov <efremov@linux.com>
Autocrypt: addr=efremov@linux.com; keydata=
 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
Message-ID: <65dee3e0-7df9-5b38-fe4c-5de3f70380a0@linux.com>
Date: Thu, 4 Jun 2020 20:22:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006041749520.2577@hadrien>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 04 Jun 2020 19:22:19 +0200 (CEST)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 04 Jun 2020 19:22:16 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] coccinelle: api: add kzfree script
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: efremov@linux.com
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

> Could you send an example of some C code on which the result is not
> suitable?

I've updated the pattern to handle false positives:

@ifok@
position p;
expression *E;
@@

(
  if (...) {
    ...
    memset(E, 0, ...)@p;
    ...
  }
|
  if (...) {
    ...
  } else {
    ...
    memset(E, 0, ...)@p;
    ...
  }
)

// Ignore kzfree definition
// Ignore kasan test
@r depends on !patch && !(file in "lib/test_kasan.c") && !(file in "mm/slab_common.c")@
expression *E;
position p != ifok.p;
@@

* memset(E, 0, ...)@p;
  ... when != E
      when != if (...) { ... E ... }
      when != for (...;...;...) { ... E ... }
      when != while (...) { ... E ... }
      when strict
* kfree(E);


Example of false positives:

void test_memset_under_if(void)
{
   char *p = malloc(10, GFP_KERNEL);
   if (p % 5) {
      p[5] = 1;
   } else {
      memset(p, 0, 10);
   }
   kfree(p);
}

void test_memset_under_if(void)
{
   int i;
   char *p = malloc(10, GFP_KERNEL);
   for (i = 0; i < 10; ++i) {
      memset(p, 0, 10);
   }
   kfree(p);
}

void test_E_in_if(void)
{
   char *p = malloc(10, GFP_KERNEL);
   memset(p, 0, 10); // when != E is not enough
   if (10) {        // when != if (...) { ... E ... } is required
      p[5] = 1;
   }
   kfree(p);
}

void test_E_in_for(void)
{
   char *p = malloc(10, GFP_KERNEL);
   memset(p, 0, 10);
   for(;;) {
      p[5] = 1;
   }
   kfree(p);
}

void test_E_in_while(void)
{
   char *p = malloc(10, GFP_KERNEL);
   memset(p, 0, 10);
   while(1) {
      p[6] = 2;
   }
   kfree(p);
}

void test_E_in_struct(void)
{
   struct t { int a[3]; };
   struct t *p = malloc(10 * sizeof(struct(struct t)), GFP_KERNEL);
   memset(p, 0, 10);
   for(;;) {
      if (1) {
        p->a[2] = 1; // I give up on this
        p->a[0] = 10;
      }
   }
   kfree(p);
}

After all it seems reasonable to me to add forall and memset_explicit rather
than handle all these false positives. Something like this for v2?

@r depends on !patch && !(file in "lib/test_kasan.c") && !(file in "mm/slab_common.c") forall@
expression *E;
position p;
@@

* \(memset\|memset_explicit\)(E, 0, ...);
  ... when != E
* kfree(E)@p;

Do I need to add "when strict" with forall or it's already enabled in this case?
Do I need to enable forall for pathing "-/+"?

Thanks,
Denis
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
